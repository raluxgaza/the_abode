var states = new Array("Abia", "Abuja Federal Capital", "Adamawa", "Akwa Ibom", "Anambra", 
                       "Bauchi", "Bayelsa", "Benue", "Borno", "Cross River", "Delta", 
                       "Ebonyi", "Edo", "Ekiti", "Enugu", "Gombe", "Imo", "Jigawa", "Kaduna", 
                       "Kano", "Katsina", "Kebbi", "Kogi", "Kwara", "Lagos", "Nassarawa", 
                       "Niger", "Ogun", "Ondo", "Osun", "Oyo", "Plateau", "Rivers", "Sokoto", 
                       "Taraba", "Yobe", "Zamfara");

for(var hi=0; hi<states.length; hi++) 
document.write("<option value=\""+states[hi]+"\">"+states[hi]+"</option>");
