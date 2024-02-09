# neroshop - WORK IN PROGRESS (ON HOLD)
[![banner](assets/images/appicons/LogoLight250x250.png)](https://github.com/larteyoh/testshop "neroshop logo")


NeroShop is a decentralized peer-to-peer marketplace for trading goods and services with [**Monero**](https://getmonero.org/)


> __Disclaimer: The neroshop team is comprised of a single developer that operates independently
> and is not affiliated, associated, authorized, endorsed by, or in any way officially connected
> with the Monero project, Monero team or any other organization.__


## Table of contents
<!-- - [The history behind neroshop](#about)-->
- [Demo](#demo)
- [Feature Status](#feature-status) <!-- - [Documentation](#documentation)-->
- [Building neroshop](#building-neroshop)
  - [Dependencies](#dependencies)
  - [Compiling neroshop from source](#compiling-neroshop-from-source)
- [Contributing](#contributing) <!-- - [Bug Bounty Program]-->
- [License](#license)
- [Donations](#donations)
- [Resources](#resources)
- [Thanks](#thanks)


## Demo
https://user-images.githubusercontent.com/58671384/219222567-f170f728-be31-43d5-b412-1f456a682bd3.mp4

<details>
<summary>Click to load images</summary>
    
![Wallet_Keys_Generation](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/Wallet_Keys_Generation.png)
![Registration](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/Registration.png)
![Login](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/Login.png)
![CatalogGrid](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/CatalogGrid.png)
![CatalogList](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/CatalogList.png)
![ProductPage](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/ProductPage.png)
![SettingsDialog_Network](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/SettingsDialog_Monero.png)
![SettingsDialog_General](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/SettingsDialog_General.png)
![HomePage](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/HomePage.png)
![HomePage_Recent_Listings](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/HomePage_Recent_Listings.png)
![Dashboard](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/Dashboard_Overview.png)
![Store_Inventory](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/Store_InventoryTab.png)
![Store_Inventory_ProductDialog_Top](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/Store_InventoryTab_ProductDialog_Top.png)
![Store_Inventory_ProductDialog_Mid](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/Store_InventoryTab_ProductDialog_Mid.png)
![Store_Inventory_ProductDialog_Bottom](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/Store_InventoryTab_ProductDialog_Bottom.png)
![WalletPage_Send](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/WalletPage_BalanceSend.png)
![WalletPage_Receive](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/WalletPage_BalanceReceive.png)
![WalletPage_Transactions](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/WalletPage_BalanceTxs.png)
![ProfilePage_ListingsTab](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/ProfilePage_ListingsTab.png)
![ProfilePage_RatingsTab](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/ProfilePage_RatingsTab.png)
![ProfilePage_With_Custom_Avatar](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/ProfilePage_With_Custom_Avatar.png)
![MessagesPage](https://github.com/larteyoh/testshop/blob/main/assets/images/screenshots/Messages_Page.png)

</details>


## Feature Status
- [ ] Distributed P2P network (urgently seeking assistance with I2P integration/NAT traversal!!!)
- [ ] Buy and sell products and services with Monero
- [x] No KYC
- [x] No censorship (censorship-resistant)
- [ ] No listing fees, sales tax, or any other fees (except for miner transaction fees and shipping costs)
    - there will be 0.5% fee for using one of the three payment options (specifically the 2-of-3 escrow system).
    This is to incentivize arbitrators (who are chosen from sellers with the highest reputation) for disputing 2/3 escrow transactions.
- [x] Pseudonymous identities 
    - sellers and buyers are identified by their unique id (monero primary address) and optional display name
- [x] End-to-end encrypted messaging system for communications between sellers and buyers
    - generated RSA-4096 private keys will be used to decrypt messages.
- [ ] Subaddress generator for direct payments without an escrow 
    - a unique subaddress will be generated from a seller's synced wallet account for each order placed by a customer
- [x] Built-in Monero wallet with basic functionalities (`transaction history`, `send`, and `receive`)
- [x] Option to run a local Monero node or connect to remote Monero nodes
- [ ] Payment address QR codes containing Monero URIs
- [ ] Option to choose between sending funds directly to a seller or by using a multisignature escrow.
- [ ] Native I2P support 
    - i2pd will be built-in (statically linked)
- [x] Seller reputation system
- [x] Product rating system (GUI Integration Pending)
- [x] Wishlists (GUI Integration Pending)
- [x] Built-in SQLite-powered search engine that can find any listing or seller
- [ ] Full-featured and user-friendly GUI application (WIP)

## Building neroshop

### Dependencies
:heavy_check_mark: = Currently in use | :o: = Optional | :x: = Marked for deprecation or removed | :grey_question: = Not in use, but may be considered 

:white_square_button: = For CLI only | :package: = Bundled

|      Library                                                       | Minimum Ver.       |         Purpose                                                        | Status                                             |
|--------------------------------------------------------------------|--------------------|------------------------------------------------------------------------|----------------------------------------------------|
| [monero-cpp](https://github.com/monero-ecosystem/monero-cpp)       | latest             | monero wallet and payment system                                       | :heavy_check_mark: :package:                       |
| [sqlite3](https://sqlite.org/)                                     | 3.38.0             | database management                                                    | :heavy_check_mark: :package:                       |
| [QR Code generator](https://github.com/nayuki/QR-Code-generator)   | ?                  | qr code generation                                                     | :heavy_check_mark: :package:                       |
| [json](https://github.com/nlohmann/json/)                          | ?                  | json parsing and msgpack                                               | :heavy_check_mark: :package:                       |
| [curl](https://github.com/curl/curl)                               | ?                  | currency conversion                                                    | :heavy_check_mark: :white_square_button:           |
| [openssl](https://github.com/openssl/openssl)                      | 1.1.1              | for curl, sha256 sum and message encryption                            | :heavy_check_mark:                                 |
| [Qt](https://www.qt.io/)                                           | 5.12.8             | graphical user interface                                               | :heavy_check_mark:                                 |
| [raft](https://github.com/willemt/raft)                            | ?                  | consensus mechanism                                                    | :grey_question: :package:                          |
| [stduuid](https://github.com/mariusbancila/stduuid)                | ?                  | unique id generation                                                   | :heavy_check_mark: :white_square_button: :package: |
| [linenoise](https://github.com/antirez/linenoise)                  | ?                  | command line interface                                                 | :heavy_check_mark: :white_square_button: :package: |
| [lua](https://www.lua.org/)                                        | 5.1.5              | configuration script                                                   | :heavy_check_mark: :package:                       |
| [cxxopts](https://github.com/jarro2783/cxxopts)                    | ?                  | command line option parser                                             | :heavy_check_mark: :package:                       |
| [libzmq](https://github.com/zeromq/libzmq)                         | ?                  | networking                                                             | :grey_question:                                    |
| [libi2pd](https://github.com/PurpleI2P/i2pd)                       | latest             | network proxy                                                          | :grey_question: :package:                          |
| [i2psam](https://github.com/i2p/i2psam)                            | ?                  | network proxy                                                          | :grey_question: :package:                          |

### Compiling neroshop from source
**0. Install prerequisites**

Debian/Ubuntu
```bash
sudo apt install build-essential cmake git
```
Arch
```bash
sudo pacman -Sy --needed base-devel cmake git
```
Fedora
```bash
sudo dnf install gcc gcc-c++ make cmake git
```


**1. Clone neroshop (and its submodules)**
```bash
git clone --recurse-submodules https://github.com/larteyoh/testshop.git
```
```bash
cd testshop
```

**2. Install dependencies**

Debian/Ubuntu
```bash
# neroshop
sudo apt install libcurl4-openssl-dev libssl-dev qtdeclarative5-dev qml-module-qt-labs-platform qml-module-qtquick-controls qml-module-qtquick-controls2 qml-module-qtquick-shapes qml-module-qtquick-dialogs
# monero-cpp (monero)
sudo apt update && sudo apt install pkg-config libssl-dev libzmq3-dev libsodium-dev libunwind8-dev liblzma-dev libreadline6-dev libpgm-dev qttools5-dev-tools libhidapi-dev libusb-1.0-0-dev libprotobuf-dev protobuf-compiler libudev-dev libboost-chrono-dev libboost-date-time-dev libboost-filesystem-dev libboost-locale-dev libboost-program-options-dev libboost-regex-dev libboost-serialization-dev libboost-system-dev libboost-thread-dev python3 ccache
```
Arch (missing Qt/QML libraries)
```bash
# neroshop
sudo pacman -Sy --needed curl openssl qt5-declarative
# monero-cpp (monero)
sudo pacman -Syu --needed boost openssl zeromq libpgm unbound libsodium libunwind xz readline gtest python3 ccache qt5-tools hidapi libusb protobuf systemd
```
Fedora (missing Qt/QML libraries)
```bash
# neroshop
sudo dnf install libcurl-devel openssl-devel
# monero-cpp (monero)
sudo dnf install boost-static libstdc++-static pkgconf boost-devel openssl-devel zeromq-devel openpgm-devel unbound-devel libsodium-devel libunwind-devel xz-devel readline-devel gtest-devel ccache qt5-linguist hidapi-devel libusbx-devel protobuf-devel protobuf-compiler systemd-devel
```


**3. Update monero-cpp submodules**
```bash
cd external/monero-cpp && ./bin/update_submodules.sh
```
```bash
cd external/monero-project
```


**4. Install expat and unbound (May be required to build monero-project on Debian/Ubuntu otherwise, this step can be skipped):**
```bash
wget https://github.com/libexpat/libexpat/releases/download/R_2_4_8/expat-2.4.8.tar.bz2
tar -xf expat-2.4.8.tar.bz2
rm expat-2.4.8.tar.bz2
cd expat-2.4.8
./configure --enable-static --disable-shared
make
sudo make install
cd ../
```

```bash
wget https://www.nlnetlabs.nl/downloads/unbound/unbound-1.16.1.tar.gz
tar -xzf unbound-1.16.1.tar.gz
rm unbound-1.16.1.tar.gz
cd unbound-1.16.1
./configure --disable-shared --enable-static --without-pyunbound --with-libevent=no --without-pythonmodule --disable-flto --with-pthreads --with-libunbound-only --with-pic
make
cd ../
```

If you happen to run into an `undefined reference to icu_*` error, you may need to add this line under the `find_package(Boost ...` in "external/monero-cpp/external/monero-project/CMakeLists.txt":
`set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -licuio -licui18n -licuuc -licudata")`

<!-- git submodule update --init --force --> <!-- <= call this before building monero -->

**5. Build monero-project to create .a libraries**
```bash
make release-static -j$(nproc)
```
```bash
cd ../../../../
```


**6. Build neroshop**

To build with [**CMake**](https://cmake.org/):

```bash
# Build external libraries
cd external/
cmake .
make -j$(nproc)
cd ..
```

```bash
# Build neroshop
cd build
cmake .. #-DNEROSHOP_BUILD_CLI=1 #-DNEROSHOP_BUILD_TESTS=1
make -j$(nproc)
```

```bash
# Run neroshop
./neroshop
```


## Contributing
See [Wiki](https://github.com/larteyoh/testshop/wiki/Contributing)


## License
This project is licensed under the [GNU General Public License v3.0 (GPLv3)](LICENSE)


## Donations
~~Donate if you like, to any of the addresses below. Received payments will be used to reward developers for completing bounties and will also be used to keep the `neroshop.org` domain up and running.~~

**Monero (XMR):**
```
45q7enruS4A87ajduA8z5wc3xfPkUwoXCeFT37f496sMBnq3f3H5sL2YccNf8iCvfoJHwbPszTo5WQPvQ4hBqqNg4cXYSHw
```
<p align="center">
    <a href="monero:45q7enruS4A87ajduA8z5wc3xfPkUwoXCeFT37f496sMBnq3f3H5sL2YccNf8iCvfoJHwbPszTo5WQPvQ4hBqqNg4cXYSHw" target="_blank"><img src="assets/images/donate_xmr.png" width="128" height="128"></img></a>
</p>

Secret view key (Monero)
```
6c3ecfd52a5f34111732d19e893e8e2ba2631c4b6fe1aea7d107373c7bdf8402
```

**Wownero (WOW):**
```
WW2pQTQWHpyJf2CHrCmZG7Tn3zBnYRZTH8g4U3pSZf5s6xsTXrZc9odDWmrWzjRc9MMQWrKXxjHsRdzH5JpJ7kzx1jZuSVSfi
```
<p align="center">
    <a href="wownero:WW2pQTQWHpyJf2CHrCmZG7Tn3zBnYRZTH8g4U3pSZf5s6xsTXrZc9odDWmrWzjRc9MMQWrKXxjHsRdzH5JpJ7kzx1jZuSVSfi" target="_blank"><img src="assets/images/donate_wow.png" width="128" height="128"></img></a>
</p>

[**OpenAlias**](https://openalias.org/):
`donate.neroshop.org` or `donate@neroshop.org`


[**Kuno**](): https://kuno.anne.media/fundraiser/lxeq/


## Resources
* Website: [neroshop.org](https://neroshop.org/)

* Neroshop DHT Specification: [specs](https://github.com/larteyoh/specs)

* Wiki: [Wikipage](https://github.com/larteyoh/testshop/wiki)

* Git (Unofficial): [github.com/larteyoh/testshop](https://github.com/larteyoh/testshop)

* Git (Official): [github.com/larteyoh/neroshop](https://github.com/larteyoh/neroshop)

* Mail: larteyoh@protonmail.com or neroshop@protonmail.com

* Matrix: [#neroshop:matrix.org](https://matrix.to/#/#neroshop:matrix.org)

* Matrix 2: [#neroshop-dev:matrix.org](https://matrix.to/#/#neroshop-dev:matrix.org)


## Thanks
```
u/EchoingCat — for the revision of the official neroshop logo
woodser — for his guidance and for his work on the monero-cpp library which has made the development of this app possible
yuriio147 — for his work on various QML components, the currency converter, wallet address qr provider, fixing a major bug in the RSA encryption code, the RSA signing and verifying functions, and for teaching me some Qt/QML techniques
lza_menace — for creating the new monero.fail JSON API endpoint
everyone in our matrix room — for sharing many great ideas that have been useful to the project
```

[//]: # (./clean.sh)
[//]: # (git checkout -b main)
[//]: # (git add .gitignore .gitmodules assets/ cmake/ CMakeLists.txt external/ LICENSE qml/ qml.qrc README.md src/ tests/)
[//]: # (git commit -m"..."    or    git commit -a --allow-empty-message -m "")
[//]: # (git push -u origin backup --force)
[//]: # (https://git.slipfox.xyz/larteyoh/testshop/settings => Mirror Settings => Synchronize Now)
[//]: # (removing an external lib from submodules index: git rm --cached path/to/submodule)
