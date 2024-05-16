hospitalization_patient <- function(transition_matrix,n_days,state){
 #sets the seed for random function (eg. sampling)
 #create a vector of length n_days to store the patient state overtime
 patient_record <- rep(0, n_days)
 #state <- 1
 #loop over number of n_days (400 loops in total)
 for (day in 1:n_days) {
  #assign starting state probability values to pr variable
  pr <- transition_matrix[state,]
  
  #determine the following state c(1:3) by sampling one of the matrix rows. Matrix row number is   determined with nrow() using the
  #probabilities from the current matrix row(node). 
  state <- sample(c(1:nrow(transition_matrix)), size = 1, prob = pr)
  
  #adds the state to the patient record at the position corresponding to the 
  #current day
  patient_record[day] <- state
 }
 
 #returns patient record
 return(patient_record)
}

set.seed(42)
#obtain ? values in the 4 nodes of markov chain
H_unk <- 1-(0.2+0.001)
S0_unk <- 1-(0.2+0.01+0.1)
SH_unk <- 1-(0.2+0.2+0.1)

#transition matrix variables representing probabilities in the markov chain.
H <- c(H_unk, 0.2,0,0.001)
S0 <- c(0.2,S0_unk,0.1,0.01)
SH <- c(0.1,0.2,SH_unk,0.2)
D <- c(0,0,0,1)

#defines the new transition matrix, days simulated and initial state
trans_matrix4N <- matrix(c(H,S0,SH,D), nrow=4, ncol=4, byrow=TRUE)
d_simulated <- 400
#init_state <- 1

#Initializes a empty vector containing all patients records for all days
total_pat <- 1000
total_out <- c()

total_df <- data.frame(matrix(ncol = 400, nrow = 0))
total_vect <- 

library(DataCombine)
#loops over each patient, creating a 400 days long record. 
for (patient in 1:total_pat){
 
 init_state <- 1
 #assigns initial state of the patient to the vector
 #calls the function assigning and assigns outcome to variable pt_rec. 
 pt_rec <- hospitalization_patient(trans_matrix4N, d_simulated,init_state)
 #appends each patient simulation to the total output vector
 total_out <- append(pt_rec,total_out)
 total_df <- InsertRow(total_df, pt_rec)
 init_state <- 1

}
plot_df = data.frame(States = total_out)

##Only need ot plot the dataframe## (melt and plot)

#dataframe to plot the states using ggplot
#ggplotting dataframe states against days using a histogram.
library(ggplot2)
ggplot(plot_df , aes(x= States)) +
 geom_histogram(binwidth = 0.6, fill = "#229954", color = "black", alpha = 0.6) + 
 labs(x = "States", y = "Days spent", title = "Days spent in each state")+
 theme_minimal()

