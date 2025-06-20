// get Button
const namesList = ['Thomas', 'Conny', 'Tina', 'Tim']
let newName = ""
setupList()
const input = document.getElementById("nameInput")
function setupList() {
    for (let i = 0; i < namesList.length; i++) {
        const item = namesList[i]
        appendLI(item, i)
    }
}

function regenerateListFromHTML() {
    // the html elements
    // foreach do:
    unserArray.add(htmlElementsFound[i].customPropertyOfUs)

}


function appendLI(name, index) {
    //const inpValue = input.value

    const LI = document.createElement("li");
    LI.innerHTML = name
    LI.classList.add("list-group-item")
    //LI.customPropertyOfUs = inpValue;
    const button = document.createElement("button");
    button.innerText = "remove"

    //button.addEventListener("click", () => {
    //    removeNameFromList()
    //})


    button.addEventListener("click", function (e) {
        let counter = 0;
        let result
        console.log(e.target.parentElement.parentElement.childNodes)
        //e.target.parentNode.remove()
        for (const ele of e.target.parentElement.parentElement.childNodes) {
            if (ele.tagName == 'LI') {
                if (ele == e.target.parentElement) {
                    result = counter
                }
                counter++
            }

        }
        console.log(result);
        // remove from array?
        namesList.splice(result, 1);
        e.target.parentElement.remove();
    })

    LI.append(button)
    document.getElementById("listInsideDiv").appendChild(LI);

}

function addNameToList_1() {

    const nameField = document.getElementById("nameInput")
    namesList.push(nameField.value)
    console.log("new Name was added: " + newName, namesList)

    appendLI(nameField.value, namesList.length - 1)
    nameField.value = "";
}






const btn = document.getElementById("submitButton")
// get Input
// input auslesen
// arrow functiuon btn.addEventListener("click", () => console.log(document.getElementById("nameInput").value));
//const random_htmlidid = `${Math.round(Math.random()*999999,0)}_btn`;
// get list
btn.addEventListener("click", addNameToList_1)
let elementId = 0;
function addNameToListWithArray() {
    const container = document.getElementById("listInsideDiv")
    const li = document.createElement("li")

    li.id = elementId
    elementId++

    const removeButton = document.createElement("button")
    li.appendChild(removeButton)

    removeButton.addEventListener("click", function () {


    })

}

//var global_i = 0;
// remove eventListener
//const remove_btn = document.getElementById(`${random_htmlidid}`)
// remove_btn.remove()
//console.log(`this button removes the ${global_i}st Element with init value ${inp}`);

function addNameToList() {
    removeNameFromList(index)
    //global_i++;
    const inp = document.getElementById("nameInput").value

    const ulElement = document.getElementById("listOfNames")
    const newLi = document.createElement("li")
    //newLi.customPropertyOfUs = inp;
    const button = document.createElement("button");
    newLi.innerHTML = `Name is ${inp}` //<button type="button">remove</button>`
    ulElement.appendChild(newLi)
    button.innerText = "Remove"
    newLi.appendChild(button)

    button.addEventListener("click", function () {
        newLi.remove()
    })
    console.log("inp.value: " + inp)
}

const sayHello = () => console.log("Hellooo");
// 
sayHello()