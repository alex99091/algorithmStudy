// 사칙연산
// 합
function add(num1, num2) {
    return num1 + num2;
}

function subtract(num1, num2) {
    return num1 - num2;
}

function multiply(num1, num2) {
    return num1 * num2;
}

function divided(num1, num2) {
    return parseInt(num1, num2);    
}

function mixedmultiplyAnddivided(num1, num2){
    return parseInt(num1 / num2 * 1000);
}


function mixedDivided(num1, num2){
    return num1 === num2 ? 1: -1;
}

function addDenom(numer1, denom1, numer2, denom2) {
    var numer = numer1 * denom2 + numer2 * denom1
    var denom = denom1 * denom2

    let getGCD = (numer, denom) => {
        let gcd = 1;
        for(let i = 2; i <= Math.min(numer, denom); i++){
            if(numer % i === 0 && denom % i === 0){
                gcd = i;
            }
        }
        return gcd;
    }
    var gcd = getGCD(numer, denom)
    answer = [numer/gcd, denom/gcd];
    return answer;
} 

console.log(addDenom(3,7,4,8))

function double(numbers) {
    var answer = [];
    
    for(let i = 0; i < numbers.length; i++) {
        answer.push(numbers[i] * 2);
    }
    
    return answer;
}
console.log(double([1,2,3,4,5]))

//각에서 0도 초과 90도 미만은 예각, 90도는 직각, 90도 초과 180도 미만은 둔각 180도는 평각으로 분류합니다.
//각 angle이 매개변수로 주어질 때 예각일 때 1, 직각일 때 2, 둔각일 때 3, 평각일 때 4를 return하도록 solution 함수를 완성해주세요.

// 예각 : 0 < angle < 90
// 직각 : angle = 90
// 둔각 : 90 < angle < 180
// 평각 : angle = 180

function Angle(angle) {
    var answer = 0;
    if(angle < 90) return 1;
    if(angle == 90) return 2;
    if(angle < 180) return 3;
    return 4;
}