ECE474 HW7
Jose Manuel Lopez Alcala

This project was verified in two ways: by inspection of the waveforms
and simple output of the clock to a txt file.

Method 1:
1)Run compile.sh
2)In modelsim waveforms, zoom out and see transitions between minutes. You really need to zoom out
to be able to see it. You might need to run more to see all the transisions, between all posibilites.

Method 2:
1)Run compile2.sh
2)Run run for a couple a seconds to see the output. Note: for some reason
it starts sampling data from 12:01 instead of 12:00, but other than than it works.

NOTE: The Gate level design was not fully
was not implemented, but it is really close. I was able to identify the cause
of it not working. The counting system is not being done correctly, and thus not
count up properly. The RTL design was done and works fine when looking at it in the
waveforms. In terms of looking for all the
