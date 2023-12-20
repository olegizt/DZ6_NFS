# DZ6_NFS
 Домашняя работа №6 - NFS

 Для развёртывания стенда необходимо скачать из этого репозиторя файлы Vagrantfile, nfsc_script.sh, nfss_script.sh
 
 Затем стартовать виртуальные машины - vagrant up
 
 Подключиться к ВМ сервера - vagrant ssh nfss (выполнить указания из текста MOTD)
 Подключиться к ВМ клиента - vagrant ssh nfsс (выполнить указания из текста MOTD)

В данной работе автоматически во время развёртывания Виртуальных Машин сервера и клиента происходит следующее:
    Сервер:
        - Устанавливаются пакеты nfs-utils и wget
        - Включается брэндмауэр firewalld
        - Настраиваются правила брэндмауэра для предоставления доступа к серверу по SSH и NFS
        - включается в автозапуск NFS
        - создаётся и настраивается директория, которая будет экспортирована в будущем
        - Создаётся структура для экспортирования созданной директории и экспортируется
        - В домашний каталог загружается из ГИТ-репозитория скрипт для проверки настроек NFS на сервере и делается исполняемым
        - Модифицируются некоторые системные файлы для отображении MOTD при SSH-подключении к серверу
    Клиент:
        - Устанавливаются пакеты nfs-utils и wget
        - Включается брэндмауэр firewalld
        - Корректируется файл fstab для монтирования сетевого каталога с сервера
        - перезагружаюся daemons (перечитываются и применяются откорректированные конфигурационные файлы)
        - В домашний каталог загружается из ГИТ-репозитория скрипт для проверки настроек NFS на сервере и делается исполняемым
        - Модифицируются некоторые системные файлы для отображении MOTD при SSH-подключении к серверу.

Для проверки развернутого стенда, можно следовать указаниям сообщений MOTD приподключении по SSH к серверу или клиенту.
