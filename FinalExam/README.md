# Итоговая аттестация

### Организуйте систему учёта для питомника, в котором живут домашние и вьючные животные.

1. Используя команду cat в терминале операционной системы Linux, создать два файла 
    Домашние животные (заполнив файл собаками, кошками, хомяками) и Вьючные животными
    заполнив файл Лошадьми, верблюдами и ослы), а затем объединить их. 
    ```shell
        $ cat > pets.txt
        $ cat > pack_animals.txt
        $ cat pets.txt pack_animals.txt > all_animals.txt
    ```
    Просмотреть содержимое созданного файла. Переименовать файл, дав ему новое имя (Друзья человека).
    ```shell
        $ cat all_animals.txt
        $ mv all_animals.txt human_friends.txt
    ```

2. Создать директорию, переместить файл туда
    ```shell
        $ mkdir animal
        $ mv human_friends.txt animal/
    ```

3. Подключить дополнительный репозиторий MySQL. Установить любой пакет
   из этого репозитория.
    ```shell
        $ sudo dpkg -i mysql-apt-config_0.8.24-1_all.deb
        $ sudo apt update 
    ```
   ```shell
      $ sudo apt install mysql-server mysql-client
      $ systemctl status mysql.service
   ```

4. Установить и удалить deb-пакет с помощью dpkg.

   ```shell
      $ sudo dpkg -i mysql-apt-config_0.8.24-1_all.deb
      $ sudo dpkg -r mysql-apt-config
      $ sudo dpkg --purge mysql-apt-config
   ```
   
5. Нарисовать диаграмму, в которой есть класс родительский класс, домашние 
животные и вьючные животные, в составы которых в случае домашних
животных войдут классы: собаки, кошки, хомяки, 
а в класс вьючные животные войдут: Лошади, верблюды и ослы).
#### Диаграмма классов.   

![diagrammaClass.jpg](img/diagrammaClass.jpg)
   
#### ERD - диаграмма

![ErdDiagramma.jpg](img/ErdDiagramma.jpg)

6. подключенном MySQL репозитории создать базу данных “Друзья человека”
[Файл 'база данных MySQL'](FinalExam/dbHumanFriends.sql)
