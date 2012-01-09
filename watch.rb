#!/usr/bin/ruby -w

# Ruby implementation of the GNU watch command line utility for Mac OS X.
# Written by: Ian Sheridan. January 2012.
# Email: ian.sheridan[@]gmail.com
# git: https://github.com/iansheridan/watcher

if ARGV.length == 0
	puts 'Syntax: watch.rb <unix commands>'
	puts 'If command contains parameters, make sure to enclose them with single quotes'
	exit
else
	command = ARGV.shift
end

print "'Ctrl + C': to end this program.......\n"
# equivalent to watch -n 2 command
while 1 do
	pipe = IO.popen(command, 'r')
	puts pipe.readlines.join
	sleep(2)
	Process.kill("KILL", pipe.pid)
	pipe.close
end
