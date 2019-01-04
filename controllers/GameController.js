.import "GameScreen.js" as GameScreen

var gameCanvas
var endEffectObject

function start() {
    console.debug("游戏开始")
    gameCanvas = GameScreen.createGameScreen(screen, createGameData())
}

function levelUp() {
    console.info("level up ...")
    screen.level++
    GameScreen.endEffectObject.destroy()
    GameScreen.gameScreenObject.destroy()
    gameCanvas = new Object
    gameCanvas = GameScreen.createGameScreen(screen, createGameData())
}

function updateData() {
    console.info("update data ...")
    screen.updateTimes++
    GameScreen.endEffectObject.destroy()
    GameScreen.gameScreenObject.destroy()
    gameCanvas = new Object
    gameCanvas = GameScreen.createGameScreen(screen, createGameData())
}

function updateScene() {
    console.info("update scene ...")
    GameScreen.endEffectObject.destroy()
    GameScreen.gameScreenObject.destroy()
    gameCanvas = new Object
    gameCanvas = GameScreen.createGameScreen(screen, createGameData())
}

function handlePress(xPos, yPos) {
    GameScreen.handlePress(xPos, yPos)
}

function handleTargetMatch(xPos, yPos) {
    GameScreen.handleTargetMatch(xPos, yPos)
}

function handleMatchTimeout() {
    switch(GameScreen.gameScreenObject.state) {
          case "waitAnswer":
              GameScreen.handleGrasp()
              break
          case "onAnswer":
              GameScreen.handlePut()
              break
       }
     GameScreen.circleTargetObject.frequency = 500
     screen.twentySecondsTimer.start()
     screen.fifteenSecondsTimer.start()
}

function handleTouchTimeout() {
    switch(GameScreen.gameScreenObject.state) {
          case "waitAnswer":
              GameScreen.handleGraspTimeout()
              break
          case "onAnswer":
              GameScreen.handlePutTimeout()
              break
       }
    GameScreen.circleTargetObject.frequency = 500
    screen.twentySecondsTimer.start()
    screen.fifteenSecondsTimer.start()
}

// 15s 计时到，显示加油标志
function addOil() {
    GameScreen.addOil()
}

// 控制游戏输出的数量
function createGameData() {
    var gameData = Object
    var number = 0
    var answer_direction = 0
    var answer_position = 1
    if (screen.level === 1) {
        //  from 1 to 10, one by one output
        number = screen.updateTimes + 1
    } else {
        number = Math.floor(Math.random() * 10) + 1
    }
    if(screen.level > 2) answer_position = Math.floor(Math.random() * 2)
    if(screen.level > 3) answer_direction = Math.floor(Math.random() * 3)
    console.debug("answer_direction = ", answer_direction)
    var target_points = []
    target_points.push(getDigitsTargetPoint(number))
    target_points.push(getAnswerPoint(answer_direction, answer_position));

    gameData.target_point_list = target_points
    gameData.number = number
    gameData.answer_position = answer_position
    gameData.answer_direction = answer_direction
    // targetPoint not set
    return gameData
}

function getAnswerPoint(answer_direction, answer_position) {
    var x
    var y
    switch(answer_direction) {
    case 0:
        y = 110
        if(answer_position === 0) x = 315
        else x = 885
        break
    case 1:
        x = 240
        if(answer_position === 0) y = 116
        else y = 685
        break
    case 2:
        x = 960
        if(answer_position === 0) y = 116
        else y = 685
        break
    }
    return [x, y]
}

function getDigitsTargetPoint(number) {
    var x
    var y
    switch (number) {
    case 1: x = 450; y = 590; break;
    case 2: x = 600; y = 590; break;
    case 3: x = 750; y = 590; break;
    case 4: x = 450; y = 440; break;
    case 5: x = 600; y = 440; break;
    case 6: x = 750; y = 440; break;
    case 7: x = 450; y = 290; break;
    case 8: x = 600; y = 290; break;
    case 9: x = 750; y = 290; break;
    case 10: x = 600; y = 730; break;
    }
    return [x, y]
}
