  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  var firebaseConfig = {
    apiKey: "AIzaSyDPVIEZnnWIRX0fCOa6I2Cdv_ecQDIQYqY",
    authDomain: "myfb-f304c.firebaseapp.com",
    projectId: "myfb-f304c",
    storageBucket: "myfb-f304c.appspot.com",
    messagingSenderId: "136371102543",
    appId: "1:136371102543:web:8a4847f99fdea7a1cadb3a",
    measurementId: "G-CN89WMMXS9"
  };
  // Initialize Firebase
  firebase.initializeApp(firebaseConfig);
  firebase.analytics();









    const db = firebase.firestore();

        // pour ne pas avoir des warnning
        db.settings({ timestampInnapshots: true });



// const docRef=firestore.doc("Medecin/Name"); // ici j'ai mis le path la ou on va stocker la donnée

// const inputextField=document.querySelector('#name'); // ici je met le id de la case d'ou je v reccuperer la donnée

// //const inputextField=document.querySelector('#email');// ici je met le id de la case d'ou je v reccuperer la donnée
// // const  type = doc.querySelector(#id )
//  const saveButton=document.querySelector('#saveButton');

// // ici j'ajoute la fonction qui va etre executer quand j'appuie sur le boutton save
// // la syntaxe :    de cette expression je prend le nom de la variable (const saveButton=document.querySelector('#save');) et je fais .addEventListener()

//  saveButton.addEventListener("click",function(){



//     const textToSave=inputextField.value;
//     console.log(" am going to save "+textToSave+"o firestore");
//     docRef.set({


//         // ici je précise le id de text fied 'ou j vais reccuperer la data

//         // ma syntaxe : <le id du text field dans html> : < la variable >
//         name : textToSave
//     }).then(function(){console.log("Statut saved!");}).catch(function(error){
//         console.log("error",error);
//     });
//  });
// ----------------------------add data--------------------------------------------------

// saving data


// const form = document.querySelector('#registerForm'); // id de form  rana n9ololo roh l hadik balise te3 html li b had l id hotha f var form

// form.addEventListener('submit', (e) => {
//     e.preventDefault();
//     db.collection('Diabtologue').add({
//         Nom: form.exampleInputName.value,
//         NumTel: form.Number.value,
//         Adresse: form.exampleInputEmail.value,
//         emailMed: form.adress.value,
//         //emailMed: form.email.value
//     });
//     form.exampleInputName.value = '';
//     form.Number.value = '';
//     form.exampleInputEmail.value = '';
//     form.adress.value = '';

// });



//************************commentaire  *******************************/
// id de form  rana n9ololo roh l hadik balise te3 html li b had l id hotha f var form
// const form = document.querySelector('#registerForm'); 


// form.addEventListener('submit', (e) => {
//     e.preventDefault();
//     db.collection('Diabtologue').add({
//         Nom: form.name.value,
//         emailMed: form.email.value
       
//     });
//     form.name.value = '';
//     form.email.value = '';
// });



const form = document.querySelector('#registerForm');

form.addEventListener('submit', (e) => {
  e.preventDefault();
  db.collection('Diabtologue').add({
    Nom: form.exampleInputName.value,
           NumTel: form.Number.value,
         Adresse: form.exampleInputEmail.value,
            emailMed: form.adress.value,
  });
      form.exampleInputName.value = '';
      form.Number.value = '';
     form.exampleInputEmail.value = '';
     form.adress.value = '';
});

//________________________________________________________________________________




// _____________________________fetch data_______________________________________________

const cafeList = document.querySelector('#cafe-list');


function renderCafe(doc){


    let db = firebase.firestore().collection("caffe");
    let li = document.createElement('li');
    let name = document.createElement('span');
    let email = document.createElement('span');


    li.setAttribute('data-id', doc.id);
    name.textContent = doc.data().Nom;
    email.textContent = doc.data().emailMed;



    li.appendChild(name);
    li.appendChild(email);
    cafeList.appendChild(li);

}

db.collection('Medicaments').get().then((snapshot)=>{console.log(snapshot.docs);})

db.collection('Diabtologue').get().then((snapshot)=>{ snapshot.docs.forEach(doc=>{renderCafe(doc)})})

//_________________________________________________________________________________________________________//