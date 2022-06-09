
#include"polynomials.h"
#include <vector>
#include <iostream>
using namespace std;

inline float sq(const float& x) { //Функция sq принимает  float число, служит для быстрого вычисления квадрата числа
    return x * x;
}

inline int signum(const float& x) {//Функция signum, принимает float число, и возвращает его знак, то есть 1 если число положительно или -1 - если отрицательное
    return (0.0 < x) - (x < 0.0);
}

inline float newton1(const float a, const float b, const float c, float x) {//Функция newton1 вычисляет первый шаг итерации Ньютона, принимает два float числа
    float y, y1;
    y = a + x;
    y1 = 2 * y + x;
    y1 = x * y1 + b;
    y = (x * y + b) * x + c;
    if (y1 != 0.0) x -= y / y1;
    return x;
}

inline int eqn_quadratic(const float a, const float b, float*& x) {//Функция для нахождения  корней квадратного урванения, принимает вектор x, в него заносятся ответы, и 2 числа float, a это коэфициент при x, а b это свободный член
    float p = -0.5f * a,
        d = sq(p) - b;//Вычисление дискриминанта
    if (d >= 0.0) {//Вычисление вещественных корней
        d = sqrt(d);
        x[1] = p - d;
        x[2] = p + d;
    }
    return 0;//Если корни комплексные возвращаем 0
}

inline int eqn_quadratic(const float a, const float b, const float c, const float e, const float f, float*& x) {//Функция для нахождения корней квадратного уравнения,  принимает вектор x, в него заносятся ответы
    //2 числа float, a это коэфициент при x, а b это свободный член
    //3 числа float,с , e, f, это коэфициенты многочлена третей степени, идущие по убыванию, они необходимы для функции  newton1
    float p = -0.5f * a,
        d = sq(p) - b;
    if (d >= 0.0) {//Вычисляем дискриминат
        d = sqrt(d);
        if (p < 0.0) {
            x[1] = newton1(c,e,f, p - d);//Вычисляем один из корней, с помощью метода Ньютона
            x[2] = p + d;
            return 2;
        }
        else {
            x[1] = p - d;
            x[2] = newton1(c, e, f, p + d);//Вычисляем один из корней, с помощью метода Ньютона
            return 2;
        }
    }
    return 0;//Если корни комплексные возвращаем 0
}

int eqn_cubic(const float a, const float b, const float e, float*& x) { // Remark #2
    int i_slope, i_loc;
    float w, xh, y, y1, y2, dx, c[2], d;
    float  prec = 1.0e-6f; // termination criterion, Remark #3
 
    w = (float)1.0f;
    if (e == 0.0) { // Отсутствует ли свободный член
        x[0] = 0.0;
        if (eqn_quadratic(a,b, x) == 0)
            return 1;
        else { 

            return 3;
        }
    }

    xh = -1.0f / 3.0f * a; // точка перегиба
    y = e + xh * (b + xh * (a + xh));
    if (y == 0.0) { // Является ли точка перегиба корнем 
        x[0] = x[1] = xh;
        c[1] = xh + a; // Понижение порядка уравнения
        c[0] = c[1] * xh + b;
        return 1 + eqn_quadratic(c[1],c[0], x);
    }
    i_loc = (y >= 0.0f);
    d = sq(a) - 3 * b;
    if ((i_slope = signum(d)) == 1) // Laguerre-Nair-Samuelson bounds
    {
        if (d < 0)
            throw sqrt_of_negative_number();
        else
            xh += ((i_loc) ? -2.0f / 3.0f : 2.0f / 3.0f) * sqrt(d);
    }
    else if (i_slope == 0) { // Седловая точка?
        x[0] = xh - cbrt(y);//Вещественный корень всего один
        return 1;
    }
    do { // Итерации ( Сам метод Галлея)
        y = a + xh;
        y1 = 2 * y + xh;
        y2 = y1 + 3 * xh;
        y1 = xh * y1 + b;
        y = (xh * y + b) * xh + e;
        dx = y * y1 / (sq(y1) - 0.5f * y * y2);
        if (isinf(dx) || isnan(dx))
            throw division_by_zero();
        xh -= dx;
    } while (fabs(dx) > prec * fabs(xh)); 
    x[0] = x[2] = xh;
    if (i_slope == 1) {
        c[1] = xh + a; // Понижение порядка уравнения
        c[0] = c[1] * xh + b;
        return 1 + eqn_quadratic(c[1],c[0], a,b,e, x);
    }
    
    return 1;
}

template<typename T>
vector<T> eqn_cubic(third_degree_polynomial<T> P)
{
    vector<float> coefs = P.get_coefs();
    float* x = new float[3];
    int j = eqn_cubic(coefs[2], coefs[1], coefs[0],x);
    vector<T> solution1(j);
    for (int i = 0; i < j; i++)
    {
        solution1[i] = x[i];
    }
    return solution1;
}




