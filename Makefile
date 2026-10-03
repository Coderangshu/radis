CXX ?= clang++
CXXFLAGS ?= -std=gnu++17 -Wall -Wextra -O2
LDFLAGS ?= -lpthread

SERVER_SRCS = server.cpp hashtable.cpp zset.cpp avl.cpp heap.cpp thread_pool.cpp
CLIENT_SRCS = client.cpp

.PHONY: all clean test test-unit test-cmds run-server

all: server client

server: $(SERVER_SRCS)
	$(CXX) $(CXXFLAGS) $(SERVER_SRCS) -o server $(LDFLAGS)

client: $(CLIENT_SRCS)
	$(CXX) $(CXXFLAGS) $(CLIENT_SRCS) -o client

test_avl: test_avl.cpp avl.cpp
	$(CXX) $(CXXFLAGS) test_avl.cpp avl.cpp -o test_avl

test_heap: test_heap.cpp
	$(CXX) $(CXXFLAGS) test_heap.cpp -o test_heap

test_offset: test_offset.cpp avl.cpp
	$(CXX) $(CXXFLAGS) test_offset.cpp avl.cpp -o test_offset

test: test-unit

test-unit: test_avl test_heap test_offset
	@echo "Running test_avl..."
	@./test_avl
	@echo "Running test_heap..."
	@./test_heap
	@echo "Running test_offset..."
	@./test_offset
	@echo "✅ All unit tests passed!"

test-cmds: client
	python3 test_cmds.py

clean:
	rm -f server client test_avl test_heap test_offset