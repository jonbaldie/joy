build:
	- docker build -t jonbaldie/joy:latest .

test:
	- docker run jonbaldie/joy which jpm | grep '/usr/local/bin/jpm'
	- docker run jonbaldie/joy pwd | grep '/usr/src/app'
	- docker run jonbaldie/joy which joy | grep '/usr/local/bin/joy'
