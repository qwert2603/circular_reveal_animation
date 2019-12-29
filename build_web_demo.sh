rm -rf docs/*
flutter clean
cd example/
flutter build web --release
cd ..
mv example/build/web/* docs