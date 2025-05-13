CXXFLAGS += -O3 -Wall -shared -std=c++11 -fPIC -fdiagnostics-color
CPPFLAGS  += $(shell python3 -m pybind11 --includes)
# 出力モジュール名を helpers_cpp にする
LIBNAME   = helpers_cpp
# コンテナ上の python3-config を使う
LIBEXT    = $(shell python3-config --extension-suffix)

default: $(LIBNAME)$(LIBEXT)

$(LIBNAME)$(LIBEXT): helpers.cpp
	$(CXX) $(CXXFLAGS) $(CPPFLAGS) helpers.cpp -o $@
