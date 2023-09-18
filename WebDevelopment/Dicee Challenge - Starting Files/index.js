window.onload = function() {
    var random_value_1 = Math.floor(Math.random() * 6) + 1;
    var random_value_2 = Math.floor(Math.random() * 6) + 1;
  
    document.querySelector(".img1").src = "./images/dice" + random_value_1 + ".png";
    document.querySelector(".img2").src = "./images/dice" + random_value_2 + ".png";
  
    if(random_value_1>random_value_2){

        document.querySelector("h1").innerHTML = " 🚩 Player 1 Won !";
    }else if(random_value_1<random_value_2){
        document.querySelector("h1").innerHTML = "Player 2 Won ! 🚩";
    }else{
        document.querySelector("h1").innerHTML = "Nobody Won !";
    }

};