

#####################################
#		Load in Data		#
#####################################

Load.data<-function(...){
	
	temp <- tempfile()
	download.file("http://www.fhwa.dot.gov/planning/processes/tools/nhpn/2015/nhpnv14-05shp.zip"
		,temp, mode="wb")

	unzip(temp, "NHPNLine.shp")
	unzip(temp, "NHPNLine.shx")
	unzip(temp, "NHPNLine.dbf")

	#unzip(temp, "NHPNLine.prj")
	#unzip(temp, "NHPNLine.shp")

	unlink(temp)

	roads=readShapeLines("NHPNLine.shp",
		delete_null_obj=TRUE)

	if(!dim(rds)==NULL){
		print("Data loaded successfully.")
	}
	else{
		stop("Data not loaded.")
		print("Suggest downloading data manually and using Read.data function.")
	}

	return(roads)
}
