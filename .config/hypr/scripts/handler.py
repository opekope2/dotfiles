#!/usr/bin/python

import os
import socket


def handle_openwindow(data):
    windowaddress, workspacename, windowclass, windowtitle = data.split(",")
    if windowclass == "firefox" and windowtitle == "Firefox — Sharing Indicator":
        print(windowaddress)


if __name__ == "__main__":
    with socket.socket(socket.AF_UNIX, socket.SOCK_STREAM) as client:
        hyprland_instance_signature = os.environ["HYPRLAND_INSTANCE_SIGNATURE"]
        client.connect(
            f"/tmp/hypr/{hyprland_instance_signature}/.socket2.sock")

        while True:
            lines = client.recv(1024).decode("UTF-8").split("\n")
            for line in lines:
                if line == "":
                    continue

                event, data = line.split(">>")

                if event == "openwindow":
                    handle_openwindow(data)
