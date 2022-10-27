for FILE in integration_test/*; 
do
  flutter drive \
    --driver=test_driver/integration_test.dart \
    --target=$FILE \
    -d web-server
done
