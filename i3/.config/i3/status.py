from i3pystatus import Status

status = Status(standalone=True)

# Displays clock like this:
# Saturday, 17 October 16:44
status.register("clock",
            format="%A, %-d %B %H:%M",)

#Displays battery like this: 75%
status.register("battery",
        format="{percentage:.0f}%",
        alert=True,
        alert_percentage=15,
        charging_color="#063289",
        full_color="#063289",
        status={
            "DIS": "Discharging",
            "CHR": "Charging",
            "FULL": "Full",
        },)

status.register("pulseaudio",
        format="{db}dB",
        step=10,
        color_muted="#896724",
        on_downscroll="decrease_volume",
        on_upscroll="increase_volume",)

status.register("weather",
        format="{current_temp}",
        location_code="ENXX0004",)

#status.register("network",
#        interface="wls1",
#        format_up="{essid} {quality:.0f}%",
#        interval=5,
#        color_up="#063289",
#        color_down="#896724",)

status.register("cmus",
        format="{artist} - {title}",
        format_not_running= '',)

status.run()
