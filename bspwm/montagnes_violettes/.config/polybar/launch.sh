#!/bin/sh

# Завершить текущие экземпляры polybar
killall -q polybar

# Ожидание полного завершения работы процессов
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Запуск Polybar со стандартным расположением конфигурационного файла в ~/.config/polybar/config
polybar -c ~/.config/polybar/config/monitor1.ini monitor1 &
polybar -c ~/.config/polybar/config/monitor2.ini monitor2 &

echo "Polybar загрузился..."
