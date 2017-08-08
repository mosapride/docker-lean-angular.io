angular.io lean
====

angular.ioのsampleを動かすために

## Usage

dockerのbuildとrun
```
docker build -t angular-io .
docker run -it -p 3000:3000 -p 3001:3001 -p 8080:8080 angular-io bash
```

コンテナ内で
```
cd angular.io/public/docs/_examples/[sample-dir]/ts
npm run build
npm run serve
```

Access http://localhost:3000

## License

MIT


