mkdir /tmp/$(date +%H-%d-%m-%Y)
cp * /tmp/$(date +%H-%d-%m-%Y)
zip -r comp.zip /tmp/$(date +%H-%d-%m-%Y)
rm -r /tmp/$(date +%H-%d-%m-%Y)
