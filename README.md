# Worked

Frontend around QC.

### Installing

```bash
$ createdb worked
$ bundle exec sequel -m db/migrations postgres:://localhost/worked
```

### Running

```bash
$ cp sample.env .env
$ foreman start
```

### Usage

```bash
$ foreman start
21:47:30 api.1    | started with pid 39140
21:47:30 worker.1 | started with pid 39141
21:47:31 api.1    | file=api fn=run app=worked task=api
21:47:31 api.1    | app=worked task=api type=api level=info message="listening on addr=0.0.0.0:5000 fd=7"
21:47:31 api.1    | app=worked task=api type=api level=info message="worker=0 spawning..."
21:47:31 api.1    | app=worked task=api type=api level=info message="master process ready"
21:47:31 api.1    | app=worked task=api type=api level=info message="worker=0 spawned pid=39142"
21:47:31 api.1    | app=worked task=api type=api level=info message="worker=0 ready"
```

```bash
$ curl -i -X POST -d '{"do": "something"}' http://localhost:5000/work
HTTP/1.1 200 OK
Date: Wed, 22 Aug 2012 04:47:44 GMT
Status: 200 OK
Connection: close
X-Frame-Options: sameorigin
X-XSS-Protection: 1; mode=block
Content-Type: application/json;charset=utf-8
Content-Length: 0
```

```bash
21:47:44 api.1    | file=api fn="POST /work" app=worked task=api do=something
21:47:44 api.1    | lib=queue_classic action=insert_job elapsed=6
21:47:44 worker.1 | file=work fn=run app=worked task=api do=something
```

```bash
$ curl -i -X POST -d '{"do": "something_else"}' http://localhost:5000/work
HTTP/1.1 200 OK
Date: Wed, 22 Aug 2012 04:47:53 GMT
Status: 200 OK
Connection: close
X-Frame-Options: sameorigin
X-XSS-Protection: 1; mode=block
Content-Type: application/json;charset=utf-8
Content-Length: 0
```

```bash
21:47:53 api.1    | file=api fn="POST /work" app=worked task=api do=something_else
21:47:53 api.1    | lib=queue_classic action=insert_job elapsed=0
21:47:53 worker.1 | file=work fn=run app=worked task=api do=something_else
```