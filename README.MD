# Monero docker daemon

Copyright (c) 2014-2018 The Monero Project.   
Portions Copyright (c) 2012-2013 The Cryptonote developers.

## Development resources

- Web: [getmonero.org](https://getmonero.org)
- Forum: [forum.getmonero.org](https://forum.getmonero.org)
- Mail: [dev@getmonero.org](mailto:dev@getmonero.org)
- GitHub: [https://github.com/monero-project/monero](https://github.com/monero-project/monero)
- IRC: [#monero-dev on Freenode](https://webchat.freenode.net/?randomnick=1&channels=%23monero-dev&prompt=1&uio=d4)

## how to use:

docker docker run --restart unless-stopped -d --name monerod -p 18082:18081 --mount type=bind,source=/media/data01/monerodata,target=/monerodata quickminer/monerod

have fun,
quickminer