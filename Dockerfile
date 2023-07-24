# Використовуємо базовий образ зі збудованим Java JDK
FROM openjdk:11

# Встановлюємо робочу директорію всередині контейнера на /usr/src/app
WORKDIR /usr/src/app

# Копіюємо вміст вашої директорії проекту всередину контейнера
COPY demo .

# Встановлюємо Maven
RUN apt-get update
RUN apt-get install -y maven

# Команда для виконання Maven збірки проекту
RUN mvn clean install -DskipTests