Despues de crear el directorio appHomeBanking, creo los archivos index.html y contacto.html y les agrego el contenido:
vagrant@VMDockerParcial:~/appHomeBanking$ vim index.html
vagrant@VMDockerParcial:~/appHomeBanking$ cat index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Docker</title>
</head>
<body>
    <h1>Hello Docker</h1>
</body>
</html>
vagrant@VMDockerParcial:~/appHomeBanking$ vim contacto.html
}vagrant@VMDockerParcial:~/appHomeBanking$ cat contacto.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contacto</title>
</head>
<body>
    <a href="https://utn.edu.ar/es/"> <img width="15%" src="./images/logo-utn.png" alt="logo-utn">  </a>
    <h1>UNIVERSIDAD TECNOLÓGICA NACIONAL</h1>

    <h1>Queremos saber tu opinion</h1>
    <form action="">

        <p>
            <label for="nombre">Nombre</label>
            <input type="text" name="nombre" required value="Gonzalo">
            <!-- placeholder="nombre" -->
        </p>

        <p>
            <label for="edad">Edad</label>
            <input type="number" name="edad">
        </p>

        <p>
            <label for="email">Email</label>
            <input type="email" name="email">
        </p>

        <p>
            <label for="comentario">Dejanos tu comentario</label>
            <textarea name="comentario"></textarea>
        </p>
        <p>
            <h4>En que horario podemos contactarte?</h4>
            <label for="turno">Mañana</label>
            <input type="radio" name="turno" value="mañana" >
            <label for="turno">Tarde</label>
            <input type="radio" name="turno" value="tarde">
            <label for="turno">Noche</label>
            <input type="radio" name="turno" value="noche" >
        </p>

        <p>
            <label for="condiciones">Acepta las condiciones</label>
            <input type="checkbox" name="condiciones">
        </p>

        <p>
            <button type="submit">Enviar</button>
            <button type="reset">Limpiar</button>
        </p>


    </form>
</body>
</html>

Creo el archivo Dockerfile y le agrego el contenido:
vagrant@VMDockerParcial:~$ touch Dockerfile
vagrant@VMDockerParcial:~$ vim Dockerfile
vagrant@VMDockerParcial:~$ cat Dockerfile
FROM nginx
COPY appHomeBanking /usr/share/nginx/html


Ubicacion de la imagen en dockerhub:
joaquinmontiel22/2parcial-ayso:v1.0

despliegue de imagen:
docker run -d -p 8080:80 joaquinmontiel22/2parcial-ayso:v1.0

