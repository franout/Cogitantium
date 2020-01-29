## TODO AND NOTES
* One of the key challenges with deep neural networks is their inherent
computational complexity, where many deep nets require billions of operations
to perform a single inference. To mitigate the computational burden of deep nets
three methods are often used:
1. Skipping redundant operations (e.g., multiply by 0) and modifying training
algorithms or post-processing weights to lead to sparse connectivity in the
network [9], [16].
2. Removing redundancy in the deep net by either trimming layers or connections
[12-13].
3. Reducing the complexity of each operation by reducing their precision and bit
width [4], [7-8], [10-11].
Because of their flexibility, FPGAs are perfect candidates to take advantage of all of
these approaches. In this work, we will explore the third approach in detail.
 * Deep learning models have three properties that make them different than many other kinds of more general purpose computations. First, they are very tolerant of reduced-precision computations. Second,
the computations performed by most models are simply different compositions of a relatively small handful of operations like matrix multiplies, vector operations, application of convolutional kernels, and other dense linear algebra calculation
Third, many of the mechanisms developed over the past 40 years to enable general-purpose programs to run with high performance on
modern CPUs, such as branch predictors, speculative execution, hyperthreaded-execution processing
cores, and deep cache memory hierarchies and TLB subsystems are unnecessary for machine learning
computations.
* bfloat16 1 bit for sign 7 bit for mantissa and 8 for exponent ( To ensure identical behavior for underMows, overMows, and NaNs, bMoat16 has the same exponent size as FP32 )
* a systolic array is a homogeneous network of tightly coupled data processing units (DPUs) called cells or nodes.
* Pitfall. Being ignorant of architecture history when designing a domainspecific architecture
* Intel FPGA SDK for OpenCL: https://www.altera.com/content/dam/altera
* pruning and quantization for training 
* Model Distillation Model distillation refers to the idea of model compression by teaching a smaller network exactly what to do, step-by-step, using a bigger, already-trained network. The ‘soft labels’ refer to the output feature maps by the bigger network after every convolution layer. The smaller network is then trained to learn the exact behavior of the bigger network by trying to replicate its outputs at every level (not just the Fnal loss ) Moreover, the addition of noise during training has been shown to improve the neural network's performance (Murray & Edwards, 1994; Bishop, 1995; Audhkhasi et al., 2013).
* From the perspective of neural network training, an aggressive reduction of the precision with which the parameter updates are computed and stored may result in the loss of the gradient information if the updates are signicantly smaller than the  for the given xed-point format.
* under some conditions there are certain layers that perform significantly better in single precision than in half precision and vice versa.
* non von neumnn co processor for training Dnns ( exploiting the fpga architecture? )  or maybeoperations in memory? 
* stream semantic registers ( on exsisting regs ) it leverages the regularity of nested loops and affine addressing to operate directly on multi-dimensional data in a scratch pad memory. ( no isa change ) 
* winogad optimization for convolution
* mlperf.org for benchmarsk 
* dataflow architecture little PE wiht cU and reg file 
* inference can be view as a subset of training 
* increase pe utilizzaton,reduce data movemet, reduce time and energy per mac, reduce unnecessary macs
* accelergy from mit for estimate energy consumption
* Filter shapes vary across layers and models ( flexible hardware )
* datasets??
* design metrics: accuracy, throughput, latency, energy and power, hardware cost
* A Dataflow is required to maximally exploit data reuse with the low-cost memory hierarchy and parallelism
* Minimizing data movement is the key to achieving high energy efficiency for DNN accelerators
* eyexam , A systematic way to quickly understand the performance limits of DNN accelerators in a step-by-step process
* timeloop for evaluating DNN
* Eyeriss architecture
* First, they are very tolerant of reduced-precision computations. Second, the computations performed by most models are simply different compositions of a relatively small handful of operations like matrix multiplies, vector operations, application of convolutional kernels, and other dense linear algebra calculations [Vanhoucke et al. 2011]. Third, many of the mechanisms developed over the past 40 years to enable general-purpose  programs to run with high performance on modern CPUs, such as branch predictors, speculative execution, hyperthreaded-execution processing cores, and deep cache memory hierarchies and TLB subsystems are unnecessary for machine learning computations 


## FUTURE READINGS

 * Ienne, P., Cornu, T., and Kuhn, G. Special-purpose digital hardware for neural networks: An architectural survey. Journal of VLSI Signal Processing Systems for Signal, Image and Video Technology 13, 1 (1996), 5–25.
“cornucopia corollary” to Amdahl’s Law—that low utilization of a huge, cheap resource can still deliver high, cost-effective performance.
* www/global/en_US/pdfs/literature/hb/opencl-sdk/aocl_programming_guide.pdf
* Atul Rahman, Sangyun Oh, Jongeun Lee, and Kiyoung Choi. Design space exploration of FPGA accelerators for convolutional neural networks.  




## READINGS 

* Deep Learning with Limited Numerical Precision, "Suyog Gupta, Ankur Agrawal, Kailash Gopalakrishnan, Pritish Narayanan"
* Mixed-precision training of deep neural networks using computational memory , Nandakumar S. R., Manuel Le Gallo, Irem Boybat,Bipin Rajendran, Abu Sebastian,Evangelos Eleftheriou1
* Mixed-precision architecture based on computational memory for training deep neural networks, S. R. Nandakumar, Manuel Le Gallo, Irem Boybat, Bipin Rajendran†, Abu Sebastian and Evangelos Eleftherin
*    <a href="https://openai.com/blog/ai-and-compute/" target="_blank">`AI and Compute  `</a>
*  <a href="http://karpathy.github.io/2019/04/25/recipe/ " target="_blank">`A recipe for training Neural Networks`</a>
* Scaling Neural Machine Translation, Myle Ott, Sergey Edunov, David Grangier, Michael Auli
* INTRODUCTION TO MIXED PRECISION TRAINING, Dusan Stosic, NVIDIA
* MIXED PRECISION TRAINING, Sharan Narang, Gregory Diamos, Erich Elseny, Paulius Micikevicius, Jonah Alben, David Garcia, Boris Ginsburg, Michael Houston,Oleksii Kuchaiev, Ganesh Venkatesh, Hao Wu
* Exploration of Low Numeric Precision 
*  Deep Learning Inference Using Intel® FPGAs,  Philip Colangelo, Nasibeh Nasiri, Asit Mishra, Eriko Nurvitadhi, Martin Margala, Kevin Nealis
* Efficient Fixed/Floating-Point Merged Mixed-Precision Multiply-Accumulate Unit for Deep Learning Processors, Hao Zhang , Hyuk Jae Lee  and Seok-Bum Ko 
* Rethinking floating point for deep learning, Jeff Johnson Facebook AI Research
* DEEP COMPRESSION: COMPRESSING DEEP NEURAL NETWORKS WITH PRUNING, TRAINED QUANTIZATION AND HUFFMAN CODING , Song Han, Huizi Mao ,William J. Dally
* DEEP LEARNING PERFORMANCE , User Guide, NVIDIA
* Computing Machinery and Intelligence, Wikipedia
* TRAINING WITH MIXED PRECISION, User Guide, NVIDIA
* Timeloop: A Systematic Approach to DNN Accelerator Evaluation, Angshuman Parashar, Priyanka Raina, Yakun Sophia Shao, Yu-Hsin Chen, Victor A. Ying, Anurag Mukkara, Rangharajan Venkatesan, Brucek Khailany ,Stephen W. Keckler, Joel Emer
* The Deep Learning Revolution and Its for Comput er Architecture and Chip Design, Jeffrey Dean , Google Research
* Harnessing Numerical Flexibility for Deep Learning on FPGAs, Andrew C. Ling , Mohamed S. Abdelfattah, Andrew Bitar,David Han, Roberto Dicecco, Suchit Subhaschandra, Chris N Johnson, Dmitry Denisenko, Josh Fender, Gordon R. Chiu
*  <a href="  https://www.european-processor-initiative.eu/project/epi/" target="_blank">`European Processor Initiative`</a>
* MIXED PRECISION TRAINING OF DEEP NEURAL NETWORKS ,Carl Case, NVIDIA
* MLPERF INFERENCE BENCHMARK, Vijay Janapa Reddi , Christine Cheng , David Kanter ,Peter Mattson , Guenther Schmuelling , Carole-JeanWu , Brian Anderson , Maximilien Breughe , Mark Charlebois , William Chou , Ramesh   hukka , Cody Coleman , Sam Davis , Pan Deng , Greg Diamos ,Jared Duke , Dave Fick , J. Scott Gardner , Itay Hubara , Sachin Idgunji , Thomas B. Jablin , Jeff Jiao , Tom St. John , Pankaj Kanwar , David Lee ,  effery Liao , Anton Lokhmotov ,Francisco Massa , Peng Meng , Paulius Micikevicius , Colin Osborne , Gennady Pekhimenko , Arun Tejusve Raghunath Rajan ,Dilip Sequeira , Ashish Sirasao , Fei Sun ,Hanlin Tang  ,Michael Thomson , Frank Wei , EphremWu , Lingjie Xu , Koichi Yamada , Bing Yu ,George Yuan , Aaron Zhong , Peizhao Zhang , Yuchen Zhou 
*  <a href="https://www.cs.bham.ac.uk/~jxb/NN/nn.html" target="_blank">`Implementing a neural network in C `</a>
* Stream Semantic Registers: A Lightweight RISC-V ISA Extension Achieving Full Compute Utilization in Single-Issue Cores , Fabian Schuiki, Florian Zaruba, Torsten Hoefler, and Luca Benini
* A Domain-Specific Architecture for Deep Neural Networks , NORMAN P. JOUPPI, CLIFF YOUNG, NISHANT PATIL, AND DAVID PATTERSON
* MIXED PRECISION TRAINING OF CONVOLUTIONAL NEURAL NETWORKS USING INTEGER OPERATIONS, Dipankar Das, Naveen Mellempudi, Dheevatsa Mudigere, Dhiraj Kalamkar, Sasikanth Avancha, Kunal Banerjee, Srinivas Sridharan, Karthik Vaidyanathan, Bharat Kaul, Evangelos Georganas, Alexander Heinecke, Pradeep Dubey, Nikita Shustrov, Roma Dubtsov, Evarist Fomenko, Vadim Pirogov, Jesus Corbal
* Fine-Grained Exploitation of Mixed Precision for Faster CNN Training
* Yongming Shen, Michael Ferdman, and Peter Milder. Maximizing CNN  accelerator  efficiency through resource partitioning.
* Yufei Ma, Yu Cao, Sarma Vrudhula, and Jae-sun Seo. Optimizing loop operation and ataflow in FPGA acceleration of deep convolutional neural networks.
* Mohammad Motamedi, Philipp Gysel, Venkatesh Akella, and Soheil Ghiasi. Design space exploration of FPGA-based deep convolutional  neural networks.  
* Hyoukjun Kwon, Ananda Samajdar, and Tushar Krishna. Maeri: Enabling flexible dataflow mapping over dnn accelerators via reconfigurable interconnects.
* Dally, W. High-performance hardware for machine learning. Invited talk at Cadence ENN Summit (Santa Clara, CA, Feb. 9, 2016)
* Han, S., Pool, J., Tran, J., and Dally, W. Learning both weights  and connections for efficient neural networks. In Proceedings of Advances in Neural Information Processing Systems (Montreal Canada, Dec.) MIT Press, Cambridge, MA, 2015
* Chen, Y., Chen, T., Xu, Z., Sun, N., and Teman, O. DianNao Family: Energy-efficient hardware accelerators for machine learning. Commun. ACM 59, 11 (Nov. 2016), 105–112. 8. Chen, Y.H., Emer, J., and Sze, V. Eyeriss: A spatial architecture for energy-efficient dataflow for  convolutional neural networks. In Proceedings of the 43rd ACM/IEEE International Symposium on Computer Architecture (Seoul, Korea), IEEE Press, 2016.


