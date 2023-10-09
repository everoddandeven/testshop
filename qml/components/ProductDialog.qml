import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import Qt.labs.platform 1.1 // FileDialog

import FontAwesome 1.0

import "." as NeroshopComponents

Popup {
    id: productDialog
    implicitWidth: 800////parent.width
    implicitHeight: 500//mainWindow.height - (mainWindow.header.height + mainWindow.footer.height)////500    
    visible: false////modal: true // <- uncomment for dimming effect
    closePolicy: Popup.CloseOnEscape | Popup.CloseOnPressOutside
    palette.text: (NeroshopComponents.Style.darkTheme) ? "#ffffff" : "#000000"
    property string inputTextColor: palette.text
    property real titleSpacing: 10 // space between title and input fields/controls
    property string inputBaseColor: (NeroshopComponents.Style.darkTheme) ? (NeroshopComponents.Style.themeName == "PurpleDust" ? "#17171c" : "#1a1a1a") : "#fafafa"
    property string inputBorderColor: (NeroshopComponents.Style.darkTheme) ? "#404040" : "#4d4d4d"
    property real inputRadius: 10
    property string optTextColor: "#708090"
    
    background: Rectangle {
        radius: 8
        color: (NeroshopComponents.Style.darkTheme) ? (NeroshopComponents.Style.themeName == "PurpleDust" ? "#0e0e11" : "#101010") : "#f0f0f0"
    
        // header
        Rectangle {
           id: titleBar
           color: "#202020"
           height: 40
           width: parent.width
           anchors.left: parent.left
           anchors.right: parent.right
           radius: 6

           // Rounded top corners
           Rectangle {
               anchors.left: parent.left
               anchors.right: parent.right
               anchors.bottom: parent.bottom
               height: parent.height / 2
               color: parent.color
           }
    
           Label {
               text: "Add item"
               color: "#ffffff"
               font.bold: true
               anchors.horizontalCenter: parent.horizontalCenter
               anchors.verticalCenter: parent.verticalCenter
           }
    
           Button {
               id: closeButton
               width: 25
               height: this.width
    
               anchors.verticalCenter: titleBar.verticalCenter
               anchors.right: titleBar.right
               anchors.rightMargin: 10
               text: qsTr(FontAwesome.xmark)
               contentItem: Text {  
                   text: closeButton.text
                   color: "#ffffff"
                   font.bold: true
                   font.family: FontAwesome.fontFamily
                   horizontalAlignment: Text.AlignHCenter
                   verticalAlignment: Text.AlignVCenter
               }
               background: Rectangle {
                   color: "#ff4d4d"
                   radius: 100
               }
               onClicked: {
                   productDialog.close()
                   mainScrollView.ScrollBar.vertical.position = 0.0 // reset scrollbar
               }
           }
       }
    }
    
    contentItem: ScrollView {
        id: mainScrollView
        anchors.fill: parent
        anchors.topMargin: titleBar.height + 20; anchors.bottomMargin: 20//anchors.topMargin////anchors.margins: 20
        clip: true
        ScrollBar.vertical.policy: ScrollBar.AlwaysOn//AsNeeded
        ColumnLayout {
            width: productDialog.availableWidth; height: productDialog.availableHeight
            spacing: 30
            Item {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: childrenRect.width
                Layout.preferredHeight: childrenRect.height
                // Product title
                Column {
                    spacing: productDialog.titleSpacing
                    Text {
                        text: "Name / Title"
                        color: productDialog.palette.text
                        font.bold: true
                    }
                            
                    TextField {
                        id: productNameField
                        width: 500; height: 50
                        placeholderText: qsTr("Enter name")
                        color: productDialog.inputTextColor
                        selectByMouse: true
                        maximumLength: 120
                        background: Rectangle { 
                            color: "transparent"
                            border.color: productDialog.inputBorderColor
                            border.width: parent.activeFocus ? 2 : 1
                            radius: productDialog.inputRadius
                        }
                    }
                }
            }
            // Product price (sales price)
            Item {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: childrenRect.width
                Layout.preferredHeight: childrenRect.height
                        
                Column {
                    spacing: productDialog.titleSpacing
                    Text {
                        text: "Price"
                        color: productDialog.palette.text
                        font.bold: true
                    }                        

                    TextField {
                        id: productPriceField
                        width: 500/* - parent.children[1].width - parent.spacing*/; height: 50//Layout.preferredWidth: 500 - parent.children[1].width - parent.spacing; Layout.preferredHeight: 50
                        placeholderText: qsTr("Enter price")
                        color: productDialog.inputTextColor
                        selectByMouse: true
                        validator: RegExpValidator{ regExp: new RegExp("^-?[0-9]+(\\.[0-9]{1," + Backend.getCurrencyDecimals(settingsDialog.currency.currentText) + "})?$") }
                        background: Rectangle { 
                            color: "transparent"
                            border.color: productDialog.inputBorderColor
                            border.width: parent.activeFocus ? 2 : 1
                            radius: productDialog.inputRadius
                        }
                        rightPadding: 25 + selectedCurrencyText.width
                        function adjustPriceDecimals() {
                            productPriceField.text = Number(productPriceField.text).toFixed(Backend.getCurrencyDecimals(settingsDialog.currency.currentText))
                        }
                        onEditingFinished: adjustPriceDecimals() // does not update when switching from crypto to fiat :(
                                    
                        Text {
                            id: selectedCurrencyText
                            text: settingsDialog.currency.currentText
                            color: productDialog.inputTextColor
                            anchors.right: parent.right
                            anchors.rightMargin: 15
                            anchors.verticalCenter: parent.verticalCenter
                            font.bold: true
                            font.pointSize: 10
                            MouseArea { 
                                anchors.fill: parent
                                onClicked: {
                                    settingsDialog.currentIndex = 0 // Switch to General Settings tab
                                    settingsDialog.open()
                                    settingsDialog.currency.popup.open()
                                }
                            }
                        }
                    }
                }
            }
            // Product quantity
            Item {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: childrenRect.width
                Layout.preferredHeight: childrenRect.height
                        
                Column {
                    spacing: productDialog.titleSpacing
                    Row {
                        spacing: 10
                        Text {
                            text: qsTr("Quantity")
                            color: productDialog.palette.text
                            font.bold: true
                        }
                        Text {
                            text: qsTr(FontAwesome.circleInfo)
                            color: productDialog.optTextColor
                            font.bold: true
                            //font.pointSize: 
                            anchors.verticalCenter: parent.children[0].verticalCenter
                            property bool hovered: false
                            NeroshopComponents.Hint {
                                x: parent.width + 10; y: ((parent.height - height) / 2) - 3
                                visible: parent.hovered
                                height: contentHeight + 20; width: contentWidth + 20
                                text: qsTr("Total number of items in stock")
                                pointer.visible: false;// delay: 0
                            }
                            MouseArea { 
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: parent.hovered = true
                                onExited: parent.hovered = false
                            }
                        }
                    }
                            
                    TextField {
                        id: productQuantityField
                        width: 500; height: 50
                        placeholderText: qsTr("Enter quantity")
                        color: productDialog.inputTextColor
                        selectByMouse: true
                        inputMethodHints: Qt.ImhDigitsOnly // for Android and iOS - typically used for input of languages such as Chinese or Japanese
                        validator: RegExpValidator{ regExp: /[0-9]*/ }
                        text: "1"
                        background: Rectangle { 
                            color: "transparent"
                            border.color: productDialog.inputBorderColor
                            border.width: parent.activeFocus ? 2 : 1
                            radius: productDialog.inputRadius
                        }     
                        rightPadding: 25 + quantityIncreaseText.contentWidth
                        function adjustQuantity() {
                            if(Number(productQuantityField.text) >= quantityIncreaseText.maximumQuantity) {
                                productQuantityField.text = quantityIncreaseText.maximumQuantity
                            }
                            if(Number(productQuantityField.text) <= quantityDecreaseText.minimumQuantity) {
                                productQuantityField.text = quantityDecreaseText.minimumQuantity
                            }
                        }
                        onEditingFinished: adjustQuantity()
                                
                        Text {
                            id: quantityIncreaseText
                            text: qsTr("\uf0d8")
                            color: productDialog.inputTextColor
                            font.bold: true
                            anchors.right: parent.right
                            anchors.rightMargin: 15
                            anchors.top: parent.top; anchors.topMargin: 10
                            property real maximumQuantity: 999999999
                            MouseArea { 
                                anchors.fill: parent
                                onClicked: {
                                    if(Number(productQuantityField.text) >= parent.maximumQuantity) {
                                        productQuantityField.text = parent.maximumQuantity
                                        return;
                                    }
                                    productQuantityField.text = Number(productQuantityField.text) + 1
                                }
                            }
                        }    
                        Text {
                            id: quantityDecreaseText
                            text: qsTr("\uf0d7")
                            color: productDialog.inputTextColor
                            font.bold: true
                            anchors.right: parent.right
                            anchors.rightMargin: 15
                            anchors.bottom: parent.bottom; anchors.bottomMargin: 10
                            property real minimumQuantity: 1
                            MouseArea { 
                                anchors.fill: parent
                                onClicked: {
                                    if(Number(productQuantityField.text) <= parent.minimumQuantity) {
                                        productQuantityField.text = parent.minimumQuantity
                                        return;
                                    }
                                    productQuantityField.text = Number(productQuantityField.text) - 1
                                }
                            }
                        }
                    }
                }
            }                                
            // Product condition
            Item {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: childrenRect.width
                Layout.preferredHeight: childrenRect.height
                        
                Column {
                    spacing: productDialog.titleSpacing
                    Text {
                        text: "Condition"
                        color: productDialog.palette.text
                        font.bold: true
                        //visible: false
                    }
                    NeroshopComponents.ComboBox {
                        id: productConditionBox
                        width: 500; height: 50
                        model: ["New", "Used", "Refurbished (Renewed)", "Not applicable"] // default is New
                        Component.onCompleted: currentIndex = find("New")
                        radius: productDialog.inputRadius
                        color: productDialog.inputBaseColor
                        textColor: productDialog.inputTextColor
                    }
                }
            }
            // Product code UPC, EAN, JAN, SKU, ISBN (for books) // https://www.simplybarcodes.com/barcode_types.html
            Item {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: childrenRect.width
                Layout.preferredHeight: childrenRect.height
                        
                Column {
                    spacing: productDialog.titleSpacing
                            
                    Row {
                        spacing: 10
                        Text {
                            text: "Product code"
                            color: productDialog.palette.text
                            font.bold: true
                        }
                        Text {
                            text: "(OPTIONAL)"
                            color: productDialog.optTextColor
                            font.bold: true
                            font.pointSize: 8
                            anchors.verticalCenter: parent.children[0].verticalCenter
                        }
                    }
                            
                    Row {
                        spacing: 5
                        TextField {
                            id: productCodeField
                            width: 500 - parent.children[1].width - parent.spacing; height: 50
                            placeholderText: qsTr("Enter product code")
                            color: productDialog.inputTextColor
                            selectByMouse: true
                            background: Rectangle { 
                                color: "transparent"
                                border.color: productDialog.inputBorderColor
                                border.width: parent.activeFocus ? 2 : 1
                                radius: productDialog.inputRadius
                            }                            
                        }
                        NeroshopComponents.ComboBox {
                            id: productCodeType
                            height: parent.children[0].height//Layout.preferredWidth: 100; Layout.preferredHeight: parent.children[0].height
                            model: ["EAN", "ISBN", "JAN", "SKU", "UPC"] // default is UPC (each code will be validated before product is listed)
                            Component.onCompleted: currentIndex = find("UPC")
                            radius: productDialog.inputRadius
                            color: productDialog.inputBaseColor
                            textColor: productDialog.inputTextColor
                        }
                    }
                }
            }
            // Product categories
            Item {
                //Layout.row: 
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: childrenRect.width
                Layout.preferredHeight: childrenRect.height
                function getCategoryStringList() {
                    let categoryStringList = []
                    let categories = Backend.getCategoryList(true)
                    for(let i = 0; i < categories.length; i++) {
                        categoryStringList[i] = categories[i].name//console.log(parent.parent.parent.categoryStringList[i])//console.log(categories[i].name)
                    }       
                    return categoryStringList;
                }
                        
                Column {
                    spacing: productDialog.titleSpacing
                    Text {
                        text: "Category"
                        color: productDialog.palette.text
                        font.bold: true
                    }
                            
                    Row {
                        spacing: 5
                        NeroshopComponents.ComboBox {
                            id: productCategoryBox
                            width: addSubCategoryButton.visible ? (500 - addSubCategoryButton.width - parent.spacing) : 500; height: 50
                            model: parent.parent.parent.getCategoryStringList()
                            Component.onCompleted: {
                                currentIndex = find("Miscellaneous")
                            }
                            function reset() {
                                let subcategories = Backend.getSubCategoryList(Backend.getCategoryIdByName(productCategoryBox.currentText), true)
                                addSubCategoryButton.visible = (subcategories.length > 0)
                                subCategoryRepeater.model = 0 // reset
                            }
                            onActivated: {
                                productCategoryBox.reset()
                            }
                            radius: productDialog.inputRadius
                            color: productDialog.inputBaseColor
                            textColor: productDialog.inputTextColor
                        }
                        Button {
                            id: addSubCategoryButton
                            width: 50; height: 50
                            text: qsTr("+")
                            visible: Backend.hasSubCategory(Backend.getCategoryIdByName(productCategoryBox.currentText))
                            background: Rectangle {
                                color: parent.hovered ? "#698b22" : "#506a1a"//"#605185"
                                radius: productDialog.inputRadius
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "#ffffff"
                                verticalAlignment: Text.AlignVCenter
                                horizontalAlignment: Text.AlignHCenter
                            }
                            onClicked: {
                                let subcategories = Backend.getSubCategoryList(Backend.getCategoryIdByName(productCategoryBox.currentText), true)
                                let max_subcategories = Math.min(2, subcategories.length)
                                if(subCategoryRepeater.count == max_subcategories) {
                                    console.log("Cannot add no more than " + max_subcategories + " subcategories")
                                    return
                                }
                                subCategoryRepeater.model = subCategoryRepeater.model + 1
                            }
                        }
                    }
                }
            }                    
            // Subcategories (will be determined based on selected categories)
            Item {
                id: subCategoryItem
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: childrenRect.width
                Layout.preferredHeight: childrenRect.height
                visible: (subCategoryRepeater.count > 0)//Backend.hasSubCategory(Backend.getCategoryIdByName(productCategoryBox.currentText))
                        
                function getSubCategoryStringList() {
                    let subCategoryStringList = []
                    let subcategories = Backend.getSubCategoryList(Backend.getCategoryIdByName(productCategoryBox.currentText), true)
                    for(let i = 0; i < subcategories.length; i++) {
                        subCategoryStringList[i] = subcategories[i].name//console.log(parent.parent.parent.categoryStringList[i])//console.log(categories[i].name)
                    }       
                    return subCategoryStringList;
                }
                        
                Column {
                    spacing: productDialog.titleSpacing
                    Text {
                        text: "Subcategory"
                        color: productDialog.palette.text
                        font.bold: true
                    }
                            
                    Repeater {
                        id: subCategoryRepeater
                        model: 0
                        delegate: Row {
                            spacing: 5
                            NeroshopComponents.ComboBox {
                                id: productSubCategoryBox
                                width: removeSubCategoryButton.visible ? (500 - removeSubCategoryButton.width - parent.spacing) : 500; height: 50
                                model: parent.parent.parent.getSubCategoryStringList()
                                currentIndex: 0
                                radius: productDialog.inputRadius
                                color: productDialog.inputBaseColor
                                textColor: productDialog.inputTextColor
                            }
                            Button {
                                id: removeSubCategoryButton
                                width: 50; height: 50
                                text: qsTr("x")
                                    background: Rectangle {
                                    color: parent.hovered ? "#b22222" : "#921c1c"
                                    radius: productDialog.inputRadius
                                }
                                contentItem: Text {
                                    text: parent.text
                                    color: "#ffffff"
                                    verticalAlignment: Text.AlignVCenter
                                    horizontalAlignment: Text.AlignHCenter
                                }
                                onClicked: {
                                    subCategoryRepeater.model = subCategoryRepeater.model - 1
                                }
                            }
                        } // Row
                    }
                }
            }
            // Weight
            Item {
                //Layout.row: 
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: childrenRect.width
                Layout.preferredHeight: childrenRect.height
                        
                Column {
                    spacing: productDialog.titleSpacing
                    Row {
                        spacing: 10
                        Text {
                            text: "Weight"
                            color: productDialog.palette.text
                            font.bold: true
                        }
                        Text {
                            text: "(OPTIONAL)"
                            color: productDialog.optTextColor
                            font.bold: true
                            font.pointSize: 8
                            anchors.verticalCenter: parent.children[0].verticalCenter
                        }                            
                    }
                            
                    Row {
                        spacing: 5
                        TextField {
                            id: productWeightField
                            width: 500 - parent.children[1].width - parent.spacing; height: 50
                            placeholderText: qsTr("Enter weight")
                            color: productDialog.inputTextColor
                            selectByMouse: true
                            validator: RegExpValidator{ regExp: new RegExp("^-?[0-9]+(\\.[0-9]{1," + 8 + "})?$") }
                            background: Rectangle { 
                                color: "transparent"
                                border.color: productDialog.inputBorderColor
                                border.width: parent.activeFocus ? 2 : 1
                                radius: productDialog.inputRadius
                            }
                        }
                        NeroshopComponents.ComboBox {
                            id: weightMeasurementUnit
                            height: parent.children[0].height
                            model: ["kg", "lb"] // default is kg (every unit of measurement will be converted to kg)
                            Component.onCompleted: currentIndex = find("kg")
                            radius: productDialog.inputRadius
                            color: productDialog.inputBaseColor
                            textColor: productDialog.inputTextColor
                        }
                    }
                }
            }                    
            // Size
            /*Item {
                  //Layout.row: 
                  Layout.alignment: Qt.AlignHCenter
                  Layout.preferredWidth: childrenRect.width
                  Layout.preferredHeight: childrenRect.height
                        
                  Column {
                      spacing: productDialog.titleSpacing
                      Row {
                          spacing: 10
                          Text {
                              text: "Size"
                              color: productDialog.palette.text
                              font.bold: true
                          }
                          Text {
                              text: "(OPTIONAL)"
                              color: productDialog.optTextColor
                              font.bold: true
                              font.pointSize: 8
                              anchors.verticalCenter: parent.children[0].verticalCenter
                          }
                      }
                         
                      Row {
                          spacing: 5
                          TextField {
                              id: productSizeField
                              width: 500; height: 50
                              placeholderText: qsTr("Enter size")
                              color: productDialog.inputTextColor
                              selectByMouse: true
                              background: Rectangle { 
                                  color: "transparent"
                                  border.color: productDialog.inputBorderColor
                                  border.width: parent.activeFocus ? 2 : 1
                                  radius: productDialog.inputRadius
                              }                            
                          }
                          //ComboBox
                     }
                 }
             }*/                    
            // Variations/Attributes (i.e. Color, Size, Type, Model, etc. options to choose from - optional)
            // Product location (ship to and ship from)
            Item {
                Layout.alignment: Qt.AlignHCenter
                Layout.preferredWidth: childrenRect.width
                Layout.preferredHeight: childrenRect.height
                property var countriesModel: ["Afghanistan", "Albania", "Algeria", "Andorra", "Angola", "Antigua & Deps", "Argentina", "Armenia", "Australia", "Austria", "Azerbaijan", "Bahamas", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", "Bolivia", "Bosnia Herzegovina", "Botswana", "Brazil", "Brunei", "Bulgaria", "Burkina", "Burundi", "Cambodia", "Cameroon", "Canada", "Cape Verde", "Central African Rep", "Chad", "Chile", "China", "Colombia", "Comoros", "Congo", "Congo (Democratic Rep)", "Costa Rica", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "East Timor", "Ecuador", "Egypt", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Eswatini", "Ethiopia", "Fiji", "Finland", "France", "Gabon", "Gambia", "Georgia", "Germany", "Ghana", "Greece", "Grenada", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", "Honduras", "Hungary", "Iceland", "India", "Indonesia", "Iran", "Iraq", "Ireland (Republic)", "Israel", "Italy", "Ivory Coast", "Jamaica", "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea North", "Korea South", "Kosovo", "Kuwait", "Kyrgyzstan", "Laos", "Latvia", "Lebanon", "Lesotho", "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macedonia", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", "Marshall Islands", "Mauritania", "Mauritius", "Mexico", "Micronesia", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", "Mozambique", "Myanmar", "Namibia", "Nauru", "Nepal", "Netherlands", "New Zealand", "Nicaragua", "Niger", "Nigeria", "Norway", "Oman", "Pakistan", "Palau", "Palestine", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal", "Qatar", "Romania", "Russian Federation", "Rwanda", "St Kitts & Nevis", "St Lucia", "Saint Vincent & the Grenadines", "Samoa", "San Marino", "Sao Tome & Principe", "Saudi Arabia", "Senegal", "Serbia", "Seychelles", "Sierra Leone", "Singapore", "Slovakia", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "South Sudan", "Spain", "Sri Lanka", "Sudan", "Suriname", "Sweden", "Switzerland", "Syria", "Taiwan", "Tajikistan", "Tanzania", "Thailand", "Togo", "Tonga", "Trinidad & Tobago", "Tunisia", "Turkey", "Turkmenistan", "Tuvalu", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", "United States", "Unspecified", "Uruguay", "Uzbekistan", "Vanuatu", "Vatican City", "Venezuela", "Vietnam", "Yemen", "Zambia", "Zimbabwe", "Worldwide",]
                        
                Column {
                    spacing: productDialog.titleSpacing
                    Row {
                        spacing: 10
                        Text {
                            text: "Location"
                            color: productDialog.palette.text
                            font.bold: true
                        }
                        Text {
                            text: qsTr(FontAwesome.circleInfo)
                            color: productDialog.optTextColor
                            font.bold: true
                            anchors.verticalCenter: parent.children[0].verticalCenter
                            property bool hovered: false
                            NeroshopComponents.Hint {
                                x: parent.width + 10; y: ((parent.height - height) / 2) - 3
                                visible: parent.hovered
                                height: contentHeight + 20; width: contentWidth + 20
                                text: qsTr("Ships from")
                                pointer.visible: false;
                            }
                            MouseArea { 
                                anchors.fill: parent
                                hoverEnabled: true
                                onEntered: parent.hovered = true
                                onExited: parent.hovered = false
                            }
                        }
                    }
                            
                    NeroshopComponents.ComboBox {
                        id: productLocationBox
                        width: 500; height: 50
                        model: parent.parent.countriesModel
                        Component.onCompleted: {
                            contentItem.selectByMouse = true
                            currentIndex = find("Unspecified")//find("Worldwide")
                        }
                        editable: true
                        onAccepted: {
                            if(find(editText) === -1)
                                model.append({text: editText})
                        }
                        radius: productDialog.inputRadius
                        color: productDialog.inputBaseColor
                        textColor: productDialog.inputTextColor
                    }
                }
            }                    
                    //Product description and bullet points
                    Item {
                        //Layout.row: 
                        Layout.alignment: Qt.AlignHCenter
                        Layout.preferredWidth: childrenRect.width
                        Layout.preferredHeight: childrenRect.height
                        
                        Column {
                            spacing: productDialog.titleSpacing
                            Text {
                                text: "Description"
                                color: productDialog.palette.text
                                font.bold: true
                            }
                            
                            ScrollView {
                                width: 500; height: 250
                                TextArea {
                                    id: productDescriptionEdit
                                    placeholderText: qsTr("Enter description")
                                    wrapMode: Text.Wrap //Text.Wrap moves text to the newline when it reaches the width//Text.WordWrap does not move text to the newline but instead it only shows the scrollbar
                                    selectByMouse: true
                                    color: productDialog.inputTextColor
                            
                                    background: Rectangle {
                                        color: "transparent"
                                        border.color: productDialog.inputBorderColor
                                        border.width: parent.activeFocus ? 2 : 1
                                        radius: productDialog.inputRadius
                                    }
                                }
                            }
                        }
                    }         
                    // Product tags
                    Item {
                        //Layout.row: 
                        Layout.alignment: Qt.AlignHCenter
                        Layout.preferredWidth: childrenRect.width
                        Layout.preferredHeight: childrenRect.height
                        
                        Column {
                            spacing: productDialog.titleSpacing
                            Text {
                                text: "Tags"
                                color: productDialog.palette.text
                                font.bold: true
                            }
                        
                            NeroshopComponents.TagField {
                                id: productTagsField
                                width: 500
                                
                                textField.color: productDialog.inputTextColor
                                textField.selectByMouse: true
                                textField.background: Rectangle { 
                                    color: "transparent"
                                    border.color: productDialog.inputBorderColor
                                    border.width: parent.activeFocus ? 2 : 1
                                    radius: productDialog.inputRadius
                                }
                            }
                        }
                    }
                    //Product images
                    Item {
                        Layout.alignment: Qt.AlignHCenter//Qt.AlignRight
                        Layout.preferredWidth: childrenRect.width//Layout.fillWidth: true
                        Layout.preferredHeight: childrenRect.height
                        
                        Column {
                            spacing: productDialog.titleSpacing
                            Text {
                                text: "Upload image(s)"
                                color: productDialog.palette.text
                                font.bold: true
                            }
                            
                            Flickable {
                                width: 500; height: 210 + ScrollBar.horizontal.height// same height as delegateRect + scrollbar height
                                contentWidth: (210 * productImageRepeater.count) + (5 * (productImageRepeater.count - 1))//<- 5 is the Flow.spacing//; contentHeight: 210//<- contentHeight is not needed unless a newline is supported
                                clip: true
                                ScrollBar.horizontal: ScrollBar {
                                    policy: ScrollBar.AlwaysOn//AsNeeded
                                }
                                Flow {
                                    width: parent.contentWidth; height: parent.height//anchors.fill: parent// Note: Flow width must be large enough to fit all items horizontally so that there won't be a need to move an item to a newline
                                    spacing: 5
                                    Repeater {
                                        id: productImageRepeater
                                        model: 6
                                        delegate: Rectangle {//Item { 
                                            width: 210; height: 210
                                            color: "transparent"
                                            //border.color: "blue"
                                        
                                            Rectangle {
                                                border.color: productDialog.palette.text
                                                anchors.top: parent.top
                                                anchors.topMargin: 5
                                                anchors.horizontalCenter: parent.horizontalCenter
                                                width: parent.width; height: parent.height - 50
                                                color: "transparent"//"#d3d3d3"//
                                                Image {
                                                    anchors.centerIn: parent // This is not necessary since the image is the same size as its parent rect but I'll keep it there just to be sure the image is centered
                                                    width: parent.width; height: parent.height
                                                    fillMode: Image.PreserveAspectFit // scale to fit
                                                    ////source: productImageFileDialog.file
                                                    mipmap: true // produces better image quality that is not pixely but smooth :D
                                                    //asynchronous: true // won't block the app
                                                    onStatusChanged: {
                                                        if(this.status == Image.Ready) {
                                                            console.log(source + ' has been loaded')
                                                            // TODO: Upload image to the database
                                                        }
                                                        if(this.status == Image.Loading) console.log("Loading image " + source + " (" + (progress * 100) + "%)")
                                                        if(this.status == Image.Error) console.log("An error occurred while loading the image")
                                                        //if(this.status == Image.Null) console.log("No image has been set" + parent.parent.index)
                                                    }
                                                }
                                                // Position the close button
                                                Button {
                                                    id: removeImageButton
                                                    anchors.right: parent.right
                                                    anchors.top: parent.top
                                                    anchors.margins: 8
                         
                                                    width: 20; height: 20//32
                                                    text: qsTr(FontAwesome.xmark)
                                                    hoverEnabled: true
                                                    visible: (parent.children[0].status === Image.Ready)
                            
                                                    contentItem: Text {
                                                        horizontalAlignment: Text.AlignHCenter
                                                        verticalAlignment: Text.AlignVCenter
                                                        text: removeImageButton.text
                                                        color: removeImageButton.hovered ? "#ffffff" : "#000000"
                                                        font.bold: true
                                                        font.family: FontAwesome.fontFamily
                                                    }
                        
                                                    background: Rectangle {
                                                        width: parent.width
                                                        height: parent.height
                                                        radius: 5//50
                                                        color: removeImageButton.hovered ? "firebrick" : "transparent"
                                                        opacity: 0.7
                                                    }
                         
                                                     onClicked: {
                                                         parent.children[0].source = ""
                                                     }
                                                     MouseArea {
                                                        anchors.fill: parent
                                                        onPressed: mouse.accepted = false
                                                        cursorShape: Qt.PointingHandCursor
                                                    }
                                                }
                                            }
                                        
                                            Button {
                                                id: chooseFileButton
                                                width: 150; height: contentItem.contentHeight + 12
                                                text: qsTr("Choose File")// %1%").arg(parent.children[0].children[0].progress * 100)
                                                anchors.bottom: parent.bottom
                                                anchors.bottomMargin: 5
                                                anchors.horizontalCenter: parent.children[0].horizontalCenter
                                                background: Rectangle {
                                                    color: parent.hovered ? "lightslategray" : "slategray"
                                                    radius: productDialog.inputRadius
                                                }
                                                contentItem: Text {
                                                    text: parent.text
                                                    color: parent.hovered ? "#d9d9d9" : "#262626"
                                                    verticalAlignment: Text.AlignVCenter
                                                    horizontalAlignment: Text.AlignHCenter
                                                }
                                                onClicked: {
                                                    if(index != 0) {
                                                        let prevProductImage = productImageRepeater.itemAt(index - 1).children[0].children[0] // get image at previous index
                                                        if(prevProductImage.status == Image.Null) { console.log("Images must be loaded in order from left to right"); return; } // If image at the previous index has not been loaded then exit this function
                                                    }
                                                    productImageFileDialog.open()
                                                }
                                            }
                                            FileDialog {
                                                id: productImageFileDialog
                                                fileMode: FileDialog.OpenFile
                                                folder: (isWindows) ? StandardPaths.writableLocation(StandardPaths.DocumentsLocation) + "/neroshop" : StandardPaths.writableLocation(StandardPaths.HomeLocation) + "/neroshop"
                                                nameFilters: ["Image files (*.bmp *.gif *.jpeg *.jpg *.png *.tif *.tiff)"]
                                                onAccepted: productImageRepeater.itemAt(index).children[0].children[0].source = currentFile
                                            }
                                        }         
                                    }                       
                                } // flow
                            }
                        }
                    }
                    // ListItem to "listings" table
                    Item {
                        Layout.alignment: Qt.AlignHCenter//Qt.AlignRight
                        Layout.preferredWidth: childrenRect.width//Layout.fillWidth: true
                        Layout.preferredHeight: childrenRect.height
                        Row {
                            spacing: 5
                        // cancelButton
                        Button {
                            id: cancelButton
                            width: 166.666666667 - parent.spacing; height: contentItem.contentHeight + 30
                            hoverEnabled: true
                            text: qsTr("Cancel")
                            background: Rectangle {
                                color: parent.hovered ? "#b22222" : "#921c1c" 
                                radius: productDialog.inputRadius
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "#ffffff"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            onClicked: {
                                productDialog.close()
                                mainScrollView.ScrollBar.vertical.position = 0.0 // reset scrollbar
                            }
                        }    
                        // listButton
                        Button {
                            id: listProductButton
                            width: 333.333333333; height: contentItem.contentHeight + 30
                            hoverEnabled: true
                            text: qsTr("Submit")
                            background: Rectangle {
                                color: parent.hovered ? "#698b22" : "#506a1a"
                                radius: productDialog.inputRadius
                            }
                            contentItem: Text {
                                text: parent.text
                                color: "#ffffff"
                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter
                            }
                            onClicked: {
                                // Check input fields to see if entered info is valid
                                // ...
                                //---------------------------------------
                                if(productNameField.text.length < 3) {
                                    messageBox.text = qsTr("Product name is too short")
                                    messageBox.open()
                                    return; // exit function
                                }
                                //---------------------------------------
                                let subcategory_ids = []//let subcategories = []
                                for (let i = 0; i < subCategoryRepeater.count; i++) {
                                    subcategory_ids.push(Backend.getSubCategoryIdByName(subCategoryRepeater.itemAt(i).children[0].currentText))//subcategories.push(subCategoryRepeater.itemAt(i).children[0].currentText)//console.log("Added subcategory: ", subcategories[i])
                                }
                                // Product subcategories cannot be duplicated
                                if(subCategoryRepeater.count >= 2) {    
                                    if((new Set(subcategory_ids)).size !== subcategory_ids.length) {
                                        messageBox.text = "Product cannot have duplicate subcategories"
                                        messageBox.open()
                                        return; // exit function
                                    }
                                }
                                //---------------------------------------
                                // Product attributes (each attribute object represents a variant of the product)
                                let attributes = [];
                                let attribute_object = {};
                                if(productWeightField.text.length > 0 && Number(productWeightField.text) > 0.00) {
                                    if(weightMeasurementUnit.currentText !== "kg") {
                                        console.log("weight is in " + weightMeasurementUnit.currentText + ". Converting to kg ...")
                                        attribute_object.weight = Backend.weightToKg(Number(productWeightField.text), weightMeasurementUnit.currentText)
                                    } else {
                                        attribute_object.weight = Number(productWeightField.text)
                                    }
                                }
                                // Add attribute obj to list as long as its filled with properties
                                if (Object.keys(attribute_object).length > 0) {
                                    attributes.push(attribute_object)
                                }
                                //---------------------------------------
                                // Product must have a minimum of 1 image
                                let productThumbnail = productImageRepeater.itemAt(0).children[0].children[0]
                                if(productThumbnail.status == Image.Null) {
                                    messageBox.text = "Product must have at least 1 image"
                                    messageBox.open()
                                    return; // exit function
                                }
                                //---------------------------------------
                                // TODO: add weight and product_code to attributes list instead
                                // Attributes will be in JSON format
                                // Todo: check whether its a product or service
                                let productImages = []
                                for(let i = 0; i < productImageRepeater.count; i++) {
                                    let productImage = productImageRepeater.itemAt(i).children[0].children[0]
                                    if(productImage.status == Image.Ready) { // If image loaded
                                        console.log("uploading " + Backend.urlToLocalFile(productImage.source) + " to the database")
                                        let image = Backend.uploadProductImage(Backend.urlToLocalFile(productImage.source), i)
                                        productImages.push(image);
                                    }
                                }
                                // List product
                                let listing_key = User.listProduct(
                                    productNameField.text, 
                                    productDescriptionEdit.text,
                                    attributes, 
                                    (productCodeField.text.length > 0) ? productCodeType.currentText.toLowerCase() + ":" + productCodeField.text : productCodeField.text,
                                    Backend.getCategoryIdByName(productCategoryBox.currentText),
                                    (subCategoryRepeater.count > 0) ? subcategory_ids : [], // subcategoryIds
                                    productTagsField.tags(),
                                    productImages,
                                    
                                    productQuantityField.text, 
                                    productPriceField.text, 
                                    selectedCurrencyText.text, 
                                    productConditionBox.currentText, 
                                    productLocationBox.currentText
                                )                       
                                // Save product thumbnail
                                Backend.saveProductThumbnail(productImages[0].source, listing_key)
                                // Save product image(s) to datastore folder
                                for (let i = 0; i < productImages.length; i++) {
                                    Backend.saveProductImage(productImages[i].source, listing_key)
                                }
                                // Clear input fields after listing product
                                productNameField.text = ""
                                productPriceField.text = ""
                                productQuantityField.text = "1"
                                productConditionBox.currentIndex = productConditionBox.find("New")
                                productCodeField.text = ""
                                productCategoryBox.currentIndex = productCategoryBox.find("Miscellaneous")
                                productCategoryBox.reset() // resets subcategories
                                productWeightField.text = ""
                                productLocationBox.currentIndex = productLocationBox.find("Unspecified")//find("Worldwide")
                                productDescriptionEdit.text = ""
                                productTagsField.clearTags()
                                // Clear upload images as well
                                for(let i = 0; i < productImageRepeater.count; i++) {
                                    let productImage = productImageRepeater.itemAt(i).children[0].children[0]
                                    productImage.source = ""
                                }
                                // close productDialog
                                productDialog.close()
                                // reset scrollbar
                                mainScrollView.ScrollBar.vertical.position = 0.0
                            }
                        }
                        }
                    }
        }
    }
}
