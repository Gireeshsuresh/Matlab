# CMAC-controller-Machine Learning
Cerebellar Model Articulation Controller (CMAC) is a model proposed by James Albus primarily for use in robotic controllers in that it replicates the mammalian cerebellum. In simple terms, CMAC outputs an algebraic sum of the weights in all the memory cells activated by the input point. The model has been widely received for it comes under cognitive architecture.

CMAC 1(Discrete) is a discrete 1-D CMAC that assigns equal weightage for all the weight vectors.

CMAC 2(Continuos) is a continuos 1-D CMAC that assigns weightage based on sliding window concept (the weight vectors at the start and end of the window will have unequal weights). A weight update of 80-20 ratio was considered for the 1st and final cells.

The data has been trained for an error threshold of 0.0001 (1/10th input data for accuracy).
