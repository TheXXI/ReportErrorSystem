const buttons = [
document.getElementById('showNewButton'),
document.getElementById('showOpenButton'),
document.getElementById('showSolvedButton'),
document.getElementById('showClosedButton'),
document.getElementById('showAllButton'),
]

const table = document.getElementById('errorsTable')
const errorsTableRows = table.getElementsByTagName('tr')
//console.log(errorsTableRows)

console.log(errorsTableRows)

buttons.forEach((button, index) => {
    button.addEventListener("click", () => showErrors(index))
})


function showErrors(index) {
    for (let i = 1; i < errorsTableRows.length; i++) {
        errorsTableRows[i].classList.remove('hide')
    }

    console.log("click")

    buttons.forEach((button) => {
        button.classList.remove('btn-primary')
        button.classList.add('btn-outline-primary')
    })

    buttons[index].classList.add('btn-primary')
    buttons[index].classList.remove('btn-outline-primary')

    for (let i = 1; i < errorsTableRows.length; i++) {

        const status = String((errorsTableRows[i].getElementsByTagName('td')[2].innerHTML).replace(/\n/g, '')).replace('\t','')
        console.log(index, status)
        if (index == 0 && status != "Новая") {
            console.log(index, status)
            errorsTableRows[i].classList.add('hide')
        }
        if (index == 1 && status != "Открытая") {
            errorsTableRows[i].classList.add('hide')
        }
        if (index == 2 && status != "Решенная") {
            errorsTableRows[i].classList.add('hide')
        }
        if (index == 3 && status != "Закрытая") {
            errorsTableRows[i].classList.add('hide')
        }
        
    }

}



//buttons[2].classList.add('btn-primary')
//buttons[2].classList.remove('btn-outline-primary')
//const startGameBtn = document.getElementById('startGameBtn')
//const loadingText = document.getElementById('loadingText')

//dev
//startGameClick()

//startGameBtn.addEventListener("click", startGameClick);

//function startGameClick() {
    //startGameBtn.classList.add('hide')
    //loadingText.classList.remove('hide')
    //sudoku = sudokuGenerator(new Sudoku())
