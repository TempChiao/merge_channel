
directory = getDirectory("Choose input directory");
files = getFileList(directory);
out = getDirectory("Choose directory to save");
for (i = 0; i < 75; i++) {
	open(directory+File.separator+files[i]);
	getImageID();
	if ((i+1) % 3 == 0){
		selectImage(1);
		rename("blue");
		selectImage(2);
		rename("green");
		selectImage(3);
		rename("red");
		run("Merge Channels...", "c1=red c2=green c3=blue create");
		run("Z Project...", "projection=[Sum Slices]");
		saveAs("Tiff", out+files[i]);
		close("*");
		}
}