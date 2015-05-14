#!/usr/bin/perl

# Remove all the files under $dir
# Where the last modified date is more than 2 days from current time.

use File::stat;
use Time::localtime;

my $dir = 'C:/Users/Ou Ye/Desktop/test';
opendir(DIR, $dir) or die $!;

# Get current local time and calculate the time 2 days from now
$twoDaysAgo_mtime = time() - 3600*24*2;
$twoDaysAgo_ctime = ctime($old);
$current_mtime = time();

print "Time for 2 Days ago $oldCtime $twoDaysAgo_mtime Current time $current_mtime\n";

# Go through every files in this directory
while (my $file = readdir(DIR)) {
	
	# Excluded parent and child directory
	next if ($file =~ m/^\./);

	# Get the last modified time of this file 
	my $file_ctime = ctime(stat("$dir/$file")->mtime);
	my $file_mtime = stat("$dir/$file")->mtime;

	# Check if the file is older than the minimum time or not
	if ($twoDaysAgo_mtime < $file_mtime){
		print "$file NEW \n";
	}else{
		# Delete the file
		print "$file deleted\n";
		unlink "$dir/$file" or warn "Could not unlink $file: $!";
	}
}

closedir(DIR);
exit 0;