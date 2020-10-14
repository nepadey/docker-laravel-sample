# Docker Laravel Sample

### Getting Started with Setting up Environment

```
git clone git@github.com:anilnabin25/docker-laravel-sample.git
cd docker-laravel-sample
sh docker/setup.sh
docker-compose up -d
```
Now type *localhost:8088* and you will see the project running\
Now run the below command to create a docker image
 > divya@ubuntu:~/project/laravel$ docker-compose up -d

As a final step, visit http://your_server_ip in the browser. You will see the following home page for your Laravel application:(if you are using in the locall http://localhost) if you change the port in the *ports* of webserver then  *:ports_no*  will be added

Some of the usefull commands
 > divya@ubuntu:\~/project/laravel$ docker ps => to check the currently running docker\
 > divya@ubuntu:\~/project/laravel$ docker-compose up -d => to create docker container\
 > divya@ubuntu:\~/project/laravel$ docker-compose exec app php artisan key:generate => to generate the artisan php key\
 > divya@ubuntu:\~/project/laravel$ docker-compose exec app php artisan config:cache => to clear the configuration


For more informatrion please click [here](https://www.digitalocean.com/community/tutorials/how-to-set-up-laravel-nginx-and-mysql-with-docker-compose)


<p align="center"><img src="https://res.cloudinary.com/dtfbvvkyp/image/upload/v1566331377/laravel-logolockup-cmyk-red.svg" width="400"></p>

<p align="center">
<a href="https://travis-ci.org/laravel/framework"><img src="https://travis-ci.org/laravel/framework.svg" alt="Build Status"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/d/total.svg" alt="Total Downloads"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/v/stable.svg" alt="Latest Stable Version"></a>
<a href="https://packagist.org/packages/laravel/framework"><img src="https://poser.pugx.org/laravel/framework/license.svg" alt="License"></a>
</p>

## About Laravel

Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

Laravel is accessible, powerful, and provides tools required for large, robust applications.

## Learning Laravel

Laravel has the most extensive and thorough [documentation](https://laravel.com/docs) and video tutorial library of all modern web application frameworks, making it a breeze to get started with the framework.

If you don't feel like reading, [Laracasts](https://laracasts.com) can help. Laracasts contains over 1500 video tutorials on a range of topics including Laravel, modern PHP, unit testing, and JavaScript. Boost your skills by digging into our comprehensive video library.

## License

The Laravel framework is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
