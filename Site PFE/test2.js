// Your web app's Firebase configuration

const { create } = require("browser-sync");

  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  var firebaseConfig = {
    apiKey: "AIzaSyDPVIEZnnWIRX0fCOa6I2Cdv_ecQDIQYqY",
    authDomain: "myfb-f304c.firebaseapp.com",
    projectId: "myfb-f304c",
    storageBucket: "myfb-f304c.appspot.com",
    messagingSenderId: "136371102543",
    appId: "1:136371102543:web:948c294d4c65cfe5cadb3a",
    measurementId: "G-2M290V0KKH"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();

document.getElementById("form").addEventListener("submit",(e)=>{
    var task =document.getElementById("task").value;
    var task =document.getElementById("description").value;
    e.preventDefault();
    createTask(task,description);
    form.reset();


});

function createTask(taskName,description){

    var task={
        task:taskName,
        description:description,
    }

    let db =firebase.firestore().collection("tasks/");
    db.add(task).then(()=>{
        swal.fire(
            'Good Job',
            'task added',
            'success'
        )

        document.getElementById("cardSection").innerHTML='';
        readTask();
    })

}

// function readTask(){

//     firebase.firestore().collection("tasks").onSnaphot(function(snapshot){

//         document.getElementById("cardSection").innerHTML='';

//         snapshot.forEach(function(taskalue){
//             document.getElementById("cardSection").innerHTML+=
//             <div class="card mb-3"> 
            
            
//             <div class="card-body"></div>
            
            
//             </div>


//         }
        
        
        
        
//         )
//     })
// }
