
macro "get_hyd_v21"{
 print("\\Clear");
 run("Clear Results");
 print("start get_hyd_v21");
 //---------------------
    //openpath = "/Volumes/Daniel/AbtGH/3D_LEIM/subjects/auto_fiji/lunardi/";
    //opendir_t2 = "t2Q_Lun";
    //opendir_ir = "irQ_Lun";
    openpath = "/Volumes/Daniel/AbtGH/3D_LEIM/subjects/auto_fiji/Kexler/";
    opendir_t2 = "Qt2_kex";
    opendir_ir = "QIR_kex";
    //
    openpath = "/Volumes/Daniel/AbtGH/3D_LEIM/subjects/7patients/Porcelli_250113/";
    opendir_t2 = "CISS_Q2_tiff";
    opendir_ir = "IR_Q2_T_tiff";
    opendir_ir_fla = "Flair_Q2_T_tiff";
    //
    openpath = "/Volumes/Daniel/AbtGH/3D_LEIM/subjects/7patients/Ross_250113/";
    opendir_t2 = "CISS_Q2_tiff";
    opendir_ir = "IR_Q2_T_tiff";
    opendir_ir_fla = "Flair_Q2_T_tiff";
    //
    openpath = "/Volumes/Daniel/AbtGH/3D_LEIM/subjects/auto_fiji/Blochinger/";
    opendir_t2 = "qt2_bloch";
    opendir_ir = "qir_bloch";
    opendir_ir = "qfla_bloch";
    //
    openpath = "/Volumes/Daniel/AbtGH/3D_LEIM/subjects/auto_fiji/Stenke/";
    opendir_t2 = "qt2_stenk";
    opendir_ir = "qir_stenk";
    opendir_ir_fla = "qfla_stenk";
    //
    openpath = "/Volumes/INNAME/AB/";
    opendir_t2 = "c4tif";
    opendir_ir = "f3tif";
    opendir_ir_fla = "ir8tif";
 //------------------------------------------
    f4t2ciss(openpath,opendir_t2);
 //------------------------------------------
    f4ir(openpath,opendir_ir,opendir_t2);
 //------------------------------------------
    f4ir(openpath,opendir_ir_fla,opendir_t2);
}
                    //// // // // // // // // // // // // // // // //
                    //                 ######                      //
                    //              ############                   //
                    //     #################################       //
////  // //////  /////  / ////  // // // // // // // // // // //  ///  / ////  // //// //// // //
//ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
////  // //// // /// // / // // // // // // // // // // // // //  / // / // // // //// //// // //
//                                     ######                                                  //
//                                  ############                                               //
//          ##     ##      #################################      ##      ##                   //
//                                  ############                                               //
//                                    #######                                                  //
////  // //// // /// // / // // // // // // // // // // // // //  / // / // // // //// //// // //
//ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
////// // / /  // //  // / /  // // // // // // // // // // // ////  // / /  // // / // / // / //
                    //     #################################       //
                    //              ############                   //
                    //                #######                      //
                    ////  // // // // // // // // // // // // // / //
function f4ir(openpath,opendir_ir,opendir_t2) {
         fullpathname = openpath + opendir_ir;
         input = openpath + opendir_ir;
         logf = openpath +  "log_ir.txt";
         print(fullpathname);
         //---------------------------------
              n_origin     =     opendir_ir + "_01_orign.tif";
              n_gaus       =     opendir_ir + "_02_gausPre.tif";
              n_medianPre  =     opendir_ir + "_03_medianPre.tif";
              n_clahe100   =     opendir_ir + "_04_clahe100.tif";
              n_clahe100q  =     opendir_ir + "_04_clahe100q.tif";
              n_clahe100m  =     opendir_ir + "_04_clahe100m.tif";
              n_nib10      =     opendir_ir + "_05_nib10.tif";
              n_nib15      =     opendir_ir + "_05_nib15.tif";
              n_nib20      =     opendir_ir + "_05_nib20.tif";
              n_nib5       =     opendir_ir + "_05_nib5.tif";
              n_Bernsen50  =     opendir_ir + "_05_Bernsen50.tif";
              n_ALThMean50 =     opendir_ir + "_05_ALThMean50.tif";
              n_tmpB     =       opendir_ir + "_06_tmpB.tif";
              n_tmpC     =       opendir_ir + "_06_tmpC.tif";
              n_tmpD     =       opendir_ir + "_06_tmpD.tif";
              n_combA     =      opendir_ir + "_07_combA.tif";
              n_combB     =      opendir_ir + "_07_combB.tif";
              n_combC     =      opendir_ir + "_07_combC.tif";
         //---------------------------------
              origin       =   openpath   + n_origin        ;
              gaus         =   openpath   + n_gaus          ;
              medianPre    =   openpath   + n_medianPre     ;
              clahe100     =   openpath   + n_clahe100      ;
              clahe100q    =   openpath   + n_clahe100q     ;
              clahe100m    =   openpath   + n_clahe100m     ;
              nib10        =   openpath   + n_nib10         ;
              nib15        =   openpath   + n_nib15         ;
              nib20        =   openpath   + n_nib20         ;
              nib5        =   openpath   + n_nib5         ;
              Bernsen50   =   openpath   + n_Bernsen50    ;
              ALThMean50   =   openpath   + n_ALThMean50    ;
              combA       =   openpath   + n_combA ;       
              combB       =   openpath   + n_combB ;       
              combC       =   openpath   + n_combC ; 
              
         //--------------- opendir_t2 ------------------
              n_t2_nib50      =   opendir_t2 + "_05_nib50.tif";
              t2_nib50        =   openpath   + n_t2_nib50 ;
              print(n_t2_nib50);
              print(t2_nib50);
         //---------------------------------
             run("Image Sequence...", "open=input sort");
             saveAs("tiff", origin);
             selectWindow(n_origin);
             close();
         //---------------PreProces---------------------------
             open(origin);
             //run("physics");
             print(n_origin);
             run("Gaussian Blur 3D...", "x=2 y=2 z=2");
             saveAs("tiff", gaus);
             selectWindow(n_gaus); 
             close();
             //------------------------------------------
             open(gaus);
             run("Median (3D)");
             saveAs("tiff", medianPre);
             print(n_medianPre);
             selectWindow(n_medianPre);
             close();
             //------------------------------------------
             open(medianPre);
             for (i=1; i<=nSlices; i++) { 
              setSlice(i); 
              //Enter the desired values in the line below 
              run("Enhance Local Contrast (CLAHE)", "blocksize=100 histogram=256 maximum=2 mask=*None*"); 
             } 
             //test 
             //run("physics");
             //run("Conversions...", " ");
             run("8-bit");
             //test 
             saveAs("tiff", clahe100);
             print(n_clahe100);
             selectWindow(n_clahe100);
             close();
        // QQQ
        // open(clahe100);
        // run("Calculator Plus", "i1=clahe100 i2=clahe100 operation=[Multiply: i2 = (i1*i2) x k1 + k2] k1=0.01 k2=0 create");
        // saveAs("tiff", clahe100q);
        //---------------FUSE---------------------------
             open(clahe100);
             open(t2_nib50);
             imageCalculator("Min create stack", n_clahe100, n_t2_nib50);
             saveAs("tiff", clahe100m);
             print(n_clahe100m);
             selectWindow(n_clahe100m);
             close();
             selectWindow(n_clahe100);
             close();
             selectWindow(n_t2_nib50);
             close();
        //---------------Auto-Th-Block---------------------------
             open(clahe100m);
             run("Auto Local Threshold", "method=Niblack radius=5 parameter_1=0 parameter_2=0 white stack");
             run("Median (3D)");
             run("Erode (3D)", "iso=255");
             saveAs("tiff", nib5);
             print(n_nib5);
             selectWindow(n_nib5); 
             close();
             selectWindow(n_clahe100m);
             close();
         //------------------------------------------
             open(clahe100m);
             run("Auto Local Threshold", "method=Niblack radius=10 parameter_1=0 parameter_2=0 white stack");
             run("Median (3D)");
             run("Erode (3D)", "iso=255");
             saveAs("tiff", nib10);
             print(n_nib10);
             selectWindow(n_nib10); 
             close();
             selectWindow(n_clahe100m);
             close();
         //------------------------------------------
             open(clahe100m);
             run("Auto Local Threshold", "method=Niblack radius=10 parameter_1=0 parameter_2=0 white stack");
             run("Median (3D)");
             run("Erode (3D)", "iso=255");
             saveAs("tiff", nib15);
             print(n_nib15);
             selectWindow(n_nib15); 
             close();
             selectWindow(n_clahe100m);
             close();
         //------------------------------------------
             open(clahe100m);
             run("Auto Local Threshold", "method=Niblack radius=10 parameter_1=0 parameter_2=0 white stack");
             run("Median (3D)");
             run("Erode (3D)", "iso=255");
             saveAs("tiff", nib20);
             print(n_nib20);
             selectWindow(n_nib20); 
             close();
             selectWindow(n_clahe100m);
             close();
         //------------------------------------------
         // Bernsen50   =   openpath   + n_Bernsen50    ;
         // ALThMean50   =   openpath   + n_ALThMean50    ;
         //------------------------------------------
             open(clahe100m);
             run("Auto Local Threshold", "method=Mean radius=10 parameter_1=0 parameter_2=0 white stack");
             run("Median (3D)");
             run("Erode (3D)", "iso=255");
             saveAs("tiff", ALThMean50);
             print(n_ALThMean50);
             selectWindow(n_ALThMean50); 
             close();
             selectWindow(n_clahe100m);
             close();
    //------------------------------------------
         /*
          */
      //open(clahe100);
      //open(nib10);

      //run("Combine...", "stack1='n_clahe100' stack2='n_nib10'combine");
      //saveAs("tiff", combB );
      //close();
         //------------------------------------------
             print("ir_finish ");             
         //------------------------------------------
             f = File.open(logf);
             //Select log window
             selectWindow("Log");
             //Get content from Log Window + Print to file
             content = getInfo();
             print(f,content);
             //Close file
             File.close(f); 
}//END of f4ir
////  // //////  /////  / ////  // // // // // // // // // // //  ///  / ////  // //// //// // //
//ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
////  // //// // /// // / // // // // // // // // // // // // //  / // / // // // //// //// // //
//                                         ######                                              //
//                                      ############                                           //
//              ##     ##      #################################      ##      ##               //
//                                      ############                                           //
//                                        #######                                              //
////  // //// // /// // / // // // // // // // // // // // // //  / // / // // // //// //// // //
//ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
////// // / /  // //  // / /  // // // // // // // // // // // ////  // / /  // // / // / // / //
function f4t2ciss(openpath,opendir) {
 fullpathname = openpath + opendir;
 input = openpath + opendir;
 logf = openpath +  "log_t2ciss.txt";
 print(fullpathname);
 //---------------------------------
      n_origin          =     opendir + "_01_orign.tif";
      n_gaus            =     opendir + "_02_gausPre.tif";
      n_medianPre       =     opendir + "_03_medianPre.tif";
      n_clahe100        =     opendir + "_04_clahe100.tif";
      n_clahe100q       =     opendir + "_04_clahe100q.tif";
      n_nib50           =     opendir + "_05_nib50.tif";
      n_Bernsen50       =     opendir + "_05_Bernsen50.tif";
      n_ALThMean50      =     opendir + "_05_ALThMean50.tif";
      n_isod            =     opendir + "_05_isod.tif";
      n_AThYen       =     opendir + "_05_AThYen.tif";
      n_tmpA        =     opendir + "_06_tmpA.tif";
      n_tmpB     =     opendir + "_06_tmpB.tif";
      n_tmpC     =     opendir + "_06_tmpC.tif";
      n_tmpD     =     opendir + "_06_tmpD.tif";
      n_combA     =     opendir + "_07_combA.tif";
      n_combB     =     opendir + "_07_combB.tif";
      n_combC     =     opendir + "_07_combC.tif";
 //---------------------------------
      origin         =   openpath   + n_origin        ;
      gaus           =   openpath   + n_gaus          ;
      medianPre      =   openpath   + n_medianPre     ;
      clahe100       =   openpath   + n_clahe100      ;
      clahe100q      =   openpath   + n_clahe100q     ;
      nib50          =   openpath   + n_nib50         ;
      Bernsen50      =    openpath   + n_Bernsen50    ;
      ALThMean50     =   openpath   + n_ALThMean50    ;
      isod           =   openpath   + n_isod          ;
      AThYen      =   openpath   + n_AThYen     ;
      tmpA       =   openpath   + n_tmpA      ;       
      tmpB    =   openpath   + n_tmpB   ;      
      tmpC    =   openpath   + n_tmpC   ;      
      tmpD    =   openpath   + n_tmpD   ;      
      combA       =   openpath   + n_combA ;       
      combB       =   openpath   + n_combB ;       
      combC       =   openpath   + n_combC ;       
 //---------------------------------
     run("Image Sequence...", "open=input sort");
     saveAs("tiff", origin);
     selectWindow(n_origin);
     close();
 //---------------PreProces---------------------------
     open(origin);
     print(n_origin);
     run("Gaussian Blur 3D...", "x=2 y=2 z=2");
     saveAs("tiff", gaus);
     selectWindow(n_gaus); 
     close();
     //------------------------------------------
     open(gaus);
     run("Median (3D)");
     saveAs("tiff", medianPre);
     print(n_medianPre);
     selectWindow(n_medianPre);
     close();
     //------------------------------------------
     open(medianPre);
     for (i=1; i<=nSlices; i++) { 
      setSlice(i); 
      //Enter the desired values in the line below 
      run("Enhance Local Contrast (CLAHE)", "blocksize=100 histogram=256 maximum=2 mask=*None*"); 
     } 
     //run("physics");
     //run("Conversions...", " ");
     run("8-bit");
     saveAs("tiff", clahe100);
     print(n_clahe100);
     selectWindow(n_clahe100);
     close();
    // QQQ
    // open(clahe100);
    // run("Calculator Plus", "i1=clahe100 i2=clahe100 operation=[Multiply: i2 = (i1*i2) x k1 + k2] k1=0.01 k2=0 create");
    // saveAs("tiff", clahe100q);
//---------------Auto-Th-Block---------------------------
     open(clahe100);
     run("Auto Local Threshold", "method=Niblack radius=50 parameter_1=0 parameter_2=0 white stack");
     run("Median (3D)");
     run("Erode (3D)", "iso=255");
     saveAs("tiff", nib50);
     print(n_nib50);
     selectWindow(n_nib50); 
     close();
     selectWindow(n_clahe100);
     close();
 //------------ADDs------------------------------
 //ooooooooooooooooooooooooooooooooooooooooooo
 close();
 open(clahe100);
 run("Auto Local Threshold", "method=Bernsen radius=50 parameter_1=0 parameter_2=0 white stack");
 run("Median (3D)");
 run("Erode (3D)", "iso=255");
 saveAs("tiff", Bernsen50);
 print(n_Bernsen50);
 selectWindow(n_Bernsen50); 
 close();
 selectWindow(n_clahe100);
 close();
 //------------------------------------------
 open(clahe100);
 run("Auto Local Threshold", "method=Mean radius=50 parameter_1=0 parameter_2=0 white stack");
 run("Median (3D)");
 run("Erode (3D)", "iso=255");
 saveAs("tiff", ALThMean50);
 print(n_ALThMean50);
 selectWindow(n_ALThMean50); 
 close();
 selectWindow(n_clahe100);
 close();
 //------------------------------------------
 //------------------------------------------
 open(clahe100);
 //run("Auto Threshold", "method=IsoData ignore_black ignore_white white stack");
 setAutoThreshold("Default dark stack");
 run("Convert to Mask", "calculate black");
 
 run("Median (3D)");
 run("Erode (3D)", "iso=255");
 saveAs("tiff", isod);
 print(n_isod);
 selectWindow(n_isod); 
 close();
 selectWindow(n_clahe100);
 close();
 //------------------------------------------
 open(clahe100);
 run("Auto Threshold", "method=Yen ignore_black ignore_white white stack");
 run("Median (3D)");
 run("Erode (3D)", "iso=255");
 saveAs("tiff", AThYen);
 print(n_AThYen);
 selectWindow(n_AThYen); 
 close();
 selectWindow(n_clahe100);
 close();
 //ooooooooooooooooooooooooooooooooooooooooooo
//------------------------------------------
  //open(clahe100);
  //open(nib50);
  //run("Combine...", "stack1='n_clahe100' stack2='n_nib50'combine");
  //saveAs("tiff", combA );
  //close();
  //
  //selectWindow( n_clahe100 );   
  //close();
  //selectWindow( n_nib50 );       
  //close();
 //------------------------------------------
     print("t2 ciss fin");             
 //------------------------------------------
     f = File.open(logf);
     //Select log window
     selectWindow("Log");
     //Get content from Log Window + Print to file
     content = getInfo();
     print(f,content);
     //Close file
     File.close(f); 
 //
 //------------------------------------------
}//FIN of f4ciss

////  // //////  /////  / ////  // // // // // // // // // // //  ///  / ////  // //// //// // //
//ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
////  // //// // /// // / // // // // // // // // // // // // //  / // / // // // //// //// // //
//                                         ######                                              //
//                                      ############                                           //
//                                      ############                                           //
//                                        #######                                              //
////  // //// // /// // / // // // // // // // // // // // // //  / // / // // // //// //// // //
//ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo
////// // / /  // //  // / /  // // // // // // // // // // // ////  // / /  // // / // / // / //
