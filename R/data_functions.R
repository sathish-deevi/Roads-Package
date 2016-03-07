

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


#####################################
#		Read in Data		#
#####################################

Read.data<-function(...){
	roads=readShapeLines("NHPNLine.shp",
		delete_null_obj=TRUE)

	if(!dim(rds)==NULL){
		print("Data loaded successfully.")
	return(roads)
}


#####################################
#		  Select States			 #
#####################################

states.rds<-function(states,...){
    
	if(!is.list(states)){
		stop("Argument states is not in list format.")


    if(!isTRUE(
        all(
         suppressWarnings(
           unlist(lapply(states,function (X){ !is.na(as.numeric(noquote(X)))} ))
            ))
            )) 
    stop("Please use numbers to identify your states.
            Consider using the ... function.")



    state.data<-vector("list",length(states))
    
    if(fortify=="TRUE"){
        if(!require("maptools",character.only = TRUE)){
            {install.packages("maptools",dep=TRUE)
             if(!require(x,character.only = TRUE)) 
                stop("Please install maptools.")
            }
        }
        state.data<-lapply(states,function(x){
            tmp.d<-roads[roads@data$STFIPS=="x",]
            f.tmp.d<-fortify(tmp.d)
            return(f.tmp.d)
            }
        )
    }
        
    if(fortify=="FALSE"){
        state.data<-lapply(states,function(x){
            roads[roads@data$STFIPS=="x",]
            }
        )
    }


    if(tmp.d%in%ls){rm(tmp.d)}
    if(f.tmp.d%in%ls){rm(f.tmp.d)}
    names(state.data)<-states
    return(state.data)    
}
