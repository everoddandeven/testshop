#pragma once

#ifndef SQLITE3_HPP_NEROSHOP
#define SQLITE3_HPP_NEROSHOP

inline constexpr const char* SQLITE3_TAG = "\033[1;36m[sqlite3]:\033[0m ";

#include <sqlite3.h>
#include <nlohmann/json.hpp>

#include <iostream>
#include <string>
#include <vector> // std::vector
#include <mutex>

namespace neroshop {

namespace db {

class Sqlite3 {
public:
    Sqlite3();
	Sqlite3(const std::string& filename, int flags = SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE);
	~Sqlite3();
	bool open(const std::string& filename, int flags = SQLITE_OPEN_READWRITE | SQLITE_OPEN_CREATE);
	void close();
	int execute(const std::string& command);
	int execute_params(const std::string& command, const std::vector<std::string>& args);
	// getters
	static std::string get_sqlite_version();
    sqlite3 * get_handle() const;
    std::string get_file() const;
    std::string get_name() const;
    std::mutex & get_mutex();
	void * get_blob(const std::string& command);
	void * get_blob_params(const std::string& command, const std::vector<std::string>& args);    
	std::string get_text(const std::string& command);// const;
	std::string get_text_params(const std::string& command, const std::vector<std::string>& args);// const;
	int get_integer(const std::string& command);
	int get_integer_params(const std::string& command, const std::vector<std::string>& args);
	double get_real(const std::string& command); // NOTE: both floats and doubles are of the 'real' datatype
	double get_real_params(const std::string& command, const std::vector<std::string>& args);
	std::vector<std::string> get_rows(const std::string& command);
	// setters
	void set_enable_mutex(bool enabled);
    // boolean
    bool is_open() const;
    bool table_exists(const std::string& table_name);
    bool is_mutex_enabled() const;
    //bool rowid_exists(const std::string& table_name, int rowid);
    std::pair<int, std::string> get_error() const; // returns the error result of the last query
    static std::string get_select(); // returns the result of the last select statement 
private:
    static int callback(void *not_used, int argc, char **argv, char **az_col_name);
	sqlite3 * handle;
	bool opened;
	std::string filename;
	std::vector<std::pair<int, std::string>> errors; // arg 1 = error code, arg 2 = error message 
    static nlohmann::json json_object;
    mutable std::mutex db_mutex;
    bool enable_mutex;
};

}

}
#endif
