//This is the Windows version, due to the path slash format
path = File.openDialog("Select the first TIF file");
dir = File.getParent(path);
print("Dir = "+dir);
name = File.getName(path);
print("Name = "+name);
list = getFileList(dir);
print("Directory contains "+list.length+" files");

stkCount = 0;
for (i=0; i<list.length; i++) {
        /*print("List member "+i+" = "+list[i]);*/
        if(endsWith(list[i], ".TIF") || endsWith(list[i], ".TIFF") || endsWith(list[i], ".tif") || endsWith(list[i], ".tiff"))
           stkCount++;
     }

print(" Num of TIF files = "+stkCount);

targetPath = getDirectory("Target folder:");

for(i=1;i<=list.length-5;i++){

        if(endsWith(list[i-1], ".TIF") || endsWith(list[i-1], ".TIFF") || endsWith(list[i-1], ".tif") || endsWith(list[i-1], ".tiff"))
        {
                fullName = dir+"\\"+list[i-1];
                dot = lastIndexOf(list[i-1], ".");
                fullArg = "open=["+fullName+"] number=5 starting="+i+" increment=1 scale=100 file=[] or=[] sort";
                run("Image Sequence...", fullArg);
                runArg = "start=1 stop=5 projection=[Average Intensity]";
                run("Z Project...", runArg);
                open(fullName);
                imageCalculator("Subtract create",2,1);
                fullSave = targetPath+"\\"+substring(list[i-1],0,dot)+"_corr.TIF";
                saveAs("Tiff", fullSave);
                close();
                close();
		   close();
		   close();
        }
}

