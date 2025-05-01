# Radis

Following [Build Your Own Redis with C/C++](https://build-your-own.org/redis/) — a from-scratch
Redis server/client in C++, chapter by chapter.

## Chapters

- `03` — Simplest client/server
- `04` — Request-response protocol
- `06` — Event loop, non-blocking IO
- `07` — Key-value server (GET/SET/DEL)
- `08` — Hashtable (part 1)
- `09` — Hashtable (part 2) + data serialization
- `10` — AVL tree
- `11` — Sorted set (AVL + hashtable)
- `12` — Timers and timeouts
- `13` — Cache expiration with TTL (heap)
- `14` — Thread pool for deferred deletion

Each chapter directory is a standalone, buildable snapshot of the server/client at that point.
