#include <vector>
#include <iostream>
#include <cmath>
#include <corecrt_math_defines.h>
#include <complex>
#include "polynomials.h"
using namespace std;

const float one_third = 1.0f / 3.0f;


inline float sq(const float& x) { //Функция sq принимает  вещественное число, служит для быстрого вычисления квадрата числа
    return x * x;
}

inline void eqn_quadratic(const float a, const float b, vector<complex<float>>& x) {//Функция для нахождения любых корней квадратного урванения, принимает вектор x, в него заносятся ответы, и 2 числа float, a это коэфициент при x, а b это свободный член
    float p = -0.5f * a,
        d = sq(p) - b;//Вычисление дискриминанта
    if (d >= 0.0) {//Вычисление вещественных корней
        d = sqrt(d);
        x[1] = p - d;
        x[2] = p + d;
    }
    else//Вычисление  корней комплексных
    {
        complex<float> v = d;
        x[1] = p - sqrt(v);
        x[2] = p + sqrt(v);
    }
}

inline void gornor(float b,  float c, vector<complex<float>>& solution)//Функция преобразующая уравнения 3 степени в уравнение 2 степени, зная один корени,  принимает вектор solution, в него заносятся ответы, и 2 числа float, b это коэфициент при x, а c это свободный член
{

    float x = real((solution[0])) + b;//Вычисление коэфициента при x
    float z = real((solution[0])) * x + c;//Вычисление свободного члена
    eqn_quadratic(  x,   z, solution);
}

void algorith(const float a, const float b, const float c,  vector<complex<float>>& solution)//Функция, находящая корни уравнения третьей степени,принимает вектор solution, в него заносятся ответы, и 3 числа float,a это коэфициент при x^2, b это коэфициент при x, а c это свободный член
{
    float e = a * one_third;
    float f = b - a * e;//Переменная f оперделяет сколько будет вещественных корней и формулу их выисления 
    float g = e * (b - 2 * e * e) - c;
    if (f == 0)
    {
        solution[0] =  cbrt(g) - e;//Нахождение вещественного корня
        gornor(b,   c,  solution);//Нахождение комплексных корней
    }
    else
    {
        float h = sqrt(4*abs(f)*one_third);
        float i = 4 * g / (h * h * h);
        if (isinf(i) || isnan(i))
            throw division_by_zero();
        if (f > 0)
        {
            solution[0] = h * sinh(one_third * asinh(i)) - e;//Нахождение вещественного корня
            gornor(b,  c, solution);//Нахождение комплексных корней
        }
        else
        {
            if (abs(i) > 1)
            {
                solution[0] = (h * signbit(i)) * cosh(one_third *  acosh(abs(i))) - e;//Нахождение вещественного корня
                return gornor(b,  c, solution);//Нахождение комплексных корней
            }
            else//Если f меньше 0 и модуль i меньше единицы, то все корни вещественные
            {
               
                float j = acos(i) * one_third;
                solution[0] = h * cos(j) - e;
                float temp = float((2 * M_PI) * one_third);//Переменная для облегчения вычислений
                solution[1] = h * cos(temp+j)-e;
                if (j==0 || j == 2 * M_PI ||j == M_PI * one_third)
                {
                    vector<float> coef1;
                    coef1[0] = real((solution[0])) + c;
                    coef1[1] = real((solution[0])) * c + b;
                    solution[2] = -(solution[1] + coef1[0]);
                }
                else
                {
                    solution[2] = h * cos(temp - j)  - e;
                }
            }
        }

    }
}

template<typename T>
vector<T> algorithW(third_degree_polynomial<T> P)
{
    vector<float> coefs = P.get_coefs();
    vector<complex<float>> solution;
    algorith( coefs[2], coefs[1], coefs[0], solution);
    if (T == complex<float>)
        return solution;
    else
    {
        vector<T> solution1;
        for (int i = 0; i < 3; i++)
        {
            solution1.push_back(real(solution[i]));
        }
        return solution1;
    }
}


int main()
{
    vector<float> answer = { 0.7f , 13 , -1.98f };
    third_degree_polynomial<float> A(answer);
    vector<float> coef = A.get_coefs();
    coef = {0.75f,-3.33f,12.7f};
    vector<complex<float>> solution(3);
    for (int i = 0; i < solution.size(); i++)
    {
        cout << solution[i] << "\n";
        //cout << answer[i] << "\n";
    }
   
}

