<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Jokes Hub</title>

<style>

*{
    box-sizing:border-box;
}

body{
    margin:0;
    font-family:Arial;
    min-height:100vh;
    display:flex;
    justify-content:center;
    align-items:center;
    padding:20px;
    background: linear-gradient(45deg,#ff4e50,#fc913a,#f9d423,#24c6dc,#514a9d);
    background-size:400% 400%;
    animation:bg 10s infinite alternate;
}

@keyframes bg{
    0%{background-position:left;}
    100%{background-position:right;}
}

.container{
    width:100%;
    max-width:500px;
    background:white;
    padding:30px;
    border-radius:15px;
    text-align:center;
    box-shadow:0 10px 30px rgba(0,0,0,0.3);
}

h1{
    color:#ff4e50;
    font-size:28px;
}

.lang{
    display:flex;
    justify-content:center;
    gap:10px;
    margin-top:10px;
}

.lang button{
    padding:8px 15px;
    border:none;
    border-radius:20px;
    cursor:pointer;
    background:#ddd;
    transition:0.3s;
}

.lang button.active{
    background:#24c6dc;
    color:white;
}

.joke{
    font-size:18px;
    margin:25px 0;
    color:#333;
    line-height:1.5;
}

.main-btn{
    padding:12px 25px;
    font-size:16px;
    border:none;
    border-radius:8px;
    background:#24c6dc;
    color:white;
    cursor:pointer;
    transition:0.3s;
}

.main-btn:hover{
    background:#514a9d;
}

@media(max-width:600px){
    .container{
        padding:20px;
    }
    h1{
        font-size:22px;
    }
    .joke{
        font-size:16px;
    }
    .main-btn{
        width:100%;
    }
}

</style>

</head>
<body>

<div class="container">

<h1>😂 Jokes Hub</h1>

<div class="lang">
    <button class="active" onclick="setLang('hindi', this)">Hindi</button>
    <button onclick="setLang('english', this)">English</button>
</div>

<div class="joke" id="joke">
Press button to read a joke 😄
</div>

<button class="main-btn" onclick="newJoke()">New Joke</button>

</div>

<script>

let currentLang = "hindi"

function setLang(lang, btn){
    currentLang = lang
    document.querySelectorAll(".lang button").forEach(b=>b.classList.remove("active"))
    btn.classList.add("active")
}

const hindiJokes = [
"टीचर: सबसे ज्यादा नशा किसमें होता है? 🤔<br> छात्र: किताबों में... खोलते ही नींद आ जाती है 😂",
"पत्नी: अगर मैं मर जाऊं? <br> पति: मैं भी मर जाऊंगा... खुशी से 😂",
"डॉक्टर: क्या परेशानी है? <br> मरीज: मोबाइल गिरता है तो दिल दुखता है 😂",
"टीचर: न्यूटन का नियम? <br> छात्र: छुट्टी के बाद सब घर जाते हैं 😂",
"मम्मी: पढ़ाई कैसी? <br> बेटा: किताबें खुलने से मना कर रही हैं 😂",
"पप्पू: मेरे पास गाड़ी है 😎<br> दोस्त: सपना वाली 😂",
"पत्नी: मैं मोटी लग रही हूँ? <br> पति: नहीं... बस ज्यादा दिख रही हो 😂",
"टीचर: बताओ 2+2? <br> छात्र: 5... confidence देखो 😂",
"पुलिस: कहाँ जा रहे हो? <br> आदमी: शादी में <br> पुलिस: बुलावा है? <br> आदमी: नहीं, दुल्हन ले जा रहा हूँ 😂",
"लड़का: I love you <br> लड़की: मैं शादीशुदा हूँ <br> लड़का: Sorry, Aunty 😂",
"पप्पू: exam में fail हो गया <br> मम्मी: क्यों? <br> पप्पू: पेपर में ही fail लिखा था 😂",
"टीचर: homework कहाँ है? <br> छात्र: sir, dog ate it 😂",
"दोस्त: girlfriend है? <br> पप्पू: नहीं, network busy है 😂",
"मम्मी: खाना खाया? <br> बेटा: हाँ <br> मम्मी: क्या? <br> बेटा: डांट 😂",
"टीचर: भारत की राजधानी? <br> छात्र: छुट्टी 😂",
"पत्नी: तुम मुझे कितना प्यार करते हो? <br> पति: जितना मोबाइल को 😂",
"डॉक्टर: आराम करो <br> मरीज: mobile use कर सकता हूँ? <br> डॉक्टर: हाँ <br> मरीज: ठीक है, फिर आराम बाद में 😂",
"पप्पू: life में क्या करोगे? <br> दोस्त: शादी 😂",
"टीचर: चुप क्यों हो? <br> छात्र: बोलूँगा तो मारोगे 😂",
"मम्मी: फोन छोड़ दो <br> बेटा: last game 😂"
]

const englishJokes = [
"Teacher: Why are you late? <br> Student: Because of the sign ‘School Ahead, Go Slow’ 😂",
"I told my computer I need a break… it said ‘No problem, I’ll go to sleep’ 😴😂",
"Why don’t programmers like nature? Too many bugs 😂",
"Why did the student eat his homework? Because the teacher said it was a piece of cake 😂",
"I asked my dog what's two minus two… he said nothing 😂",
"Why was the math book sad? Because it had too many problems 😂",
"I’m not lazy… I’m on energy-saving mode 😂",
"Why did the phone go to school? To get smarter 😂",
"What do you call fake spaghetti? An impasta 😂",
"I only know 25 letters of the alphabet… I don’t know y 😂",
"Why did the scarecrow win an award? Because he was outstanding in his field 😂",
"Parallel lines have so much in common… it’s a shame they’ll never meet 😂",
"Why don’t skeletons fight each other? They don’t have the guts 😂",
"I used to play piano by ear… now I use my hands 😂",
"What’s orange and sounds like a parrot? A carrot 😂",
"I told a joke about construction… but I’m still working on it 😂",
"Why did the coffee file a police report? It got mugged 😂",
"I tried to catch fog… I mist 😂",
"What did one wall say to the other? I’ll meet you at the corner 😂",
"Why don’t eggs tell jokes? They’d crack up 😂"
]

function newJoke(){
    let jokes = currentLang === "hindi" ? hindiJokes : englishJokes
    let random = Math.floor(Math.random()*jokes.length)
    document.getElementById("joke").innerHTML = jokes[random]
}

</script>

</body>
</html>