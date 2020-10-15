set -e
  
echo "=== Copy .env  ==="
cp .env.example .env
echo "=== copy is done!  ==="

echo "=== Execute docker-compose build... ==="
docker-compose build
echo "=== docker-compose build is done!! ==="

echo "=== Installing composer... ==="
composer install
echo "=== Composer build is done!! ==="

echo "==== Generating the app key ==="
docker-compose run app php artisan key:generate
echo "==== App key generating is done!! ==="
