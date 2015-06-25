$fn = 32;

module cover(){    
    dome();
    backridge();
    base();
    fin();
    rim();  
    foam();
}

module backridge(){
     translate([0,0, 20]){
        difference(){
            union(){
                difference(){
                    sphere(10, center=true);
                    sphere(9.2, center=true);
                
                }
            }
            translate([0,0,-10]){
                cylinder(10,10,10);
            } 
            translate([0,0,3]){
                cylinder(10,10,10);
            }          
            translate([-10,0,2]){
                cube([20,20,10], center=true);
            }       
        }
        difference(){
            rotate([0,90]){
                translate([0,0,-10]){
                    difference(){
                        cylinder(10,10,10);
                        cylinder(20,9.2,9.2);
                    } 
                }
            }
            translate([0,0,8]){
                cube([20,20,10], center=true);
            }   
            translate([0,0,-5]){
                cube([20,20,10], center=true);
            }         
        }
    }     
    
}

module base(){
   	translate([-10, 0, 0]){
        difference(){
            rotate([0,90]){
                difference(){
                    difference(){
                        union(){
                            cylinder(d=20, h=10);
                            translate([-10,0,5]){
                                cube([20,20,10], center=true);
                            }
                        }

                        union(){
                            cylinder(d=18.4, h=10);
                            translate([-10,0,5]){
                                cube([20,18.4,10], center=true);
                            }
                        }
                    }
                    translate([10,0,5]){
                        rotate([0, -90]){
                            cylinder(d=8, h=3);
                            translate([-4,0,0]){
                                cube([8,8,8], center=true);
                            }
                        }
                    }             
                }
            }
        }
	} 
}

module dome(){
 	difference(){
		union(){
			difference(){
				sphere(10, center=true);
				sphere(9.2, center=true);
				cylinder(25,9.2,9.2);
			}
			difference(){
				cylinder(20,10,10);
				cylinder(25,9.2,9.2);
			}
		}

		translate([-10, 0, 0]){
			cube([20,20,50], center=true);
		}
	}     
}

module fin(){
	/* Small finn behind */
	translate([-9.5,0,20]){
		rotate([0,90,0]){
			difference(){
				cylinder(d=25, h=1, center=true);
				translate([5,0,0]){
					cylinder(d=16, h=1, center=true);
                    translate([5,0,0]){
                        cube([10,16,2], center=true);
                    }
				}
                
			}
            
		}
	}     
}

module rim(){  
	translate([-9.5,0,10]){
		difference(){
			union(){
				cube([1,25,19], center=true);
				translate([0,0,-10]){
					rotate([0,90,0]){
						cylinder(d=25, h=1, center=true);
					}
				}
			}
			union(){
				cube([2,16,20], center=true);
				translate([0,0,-10]){
					rotate([0,90,0]){
						cylinder(d=16, h=2, center=true);
					}
				}
				translate([0,0,-15]){
					cube([2, 8, 20], center = true);
				}
			}

		}
	}   
}

module iv(){
	translate([0, 43, 4]){
		cylinder(d=10, h=10);
	}

	translate([0, 38, -4]){
		cube(size = [30, 10, 2], center=true);
	}

	rotate([-90]){
		cylinder(h=25, d=1);
		translate([0,0,25]){
			cylinder(h=29, d1=4, d2=6);
			translate([0,0,29]){
				cylinder(h=10, d=10);
				translate([0,0,10]){
					cylinder(h=12, d=4);
				}
			}
		}
	} 
}


module foam(){
        difference(){
        /* Pos Oval*/
        translate([-11,0,0]){
            hull(){
                translate([0,0,20]){
                    rotate([0,90,0]){
                        cylinder(d=27, h=1, center=true);
                    }
                }
                rotate([0,90,0]){
                    cylinder(d=27, h=1, center=true);
                }
            }
        }
        
        /* Neg Oval*/
        translate([-11,0,0]){
            hull(){
                translate([0,0,15]){
                    rotate([0,90,0]){
                        cylinder(d=14, h=2, center=true);
                    }
                }
                rotate([0,90,0]){
                    cylinder(d=14, h=2, center=true);
                }
            }
        }
        
        /* Neg Slot */
        translate([-10,0,-5]){
            cube([8,4,18], center=true);
        }    
    }      
}



translate([-6, 0, -40]){
	rotate([100,0,90]){
		 //color([0,1,0]) iv();
	}
}


translate([0,0,0]){
	color([0,0,1]) cover();
}
