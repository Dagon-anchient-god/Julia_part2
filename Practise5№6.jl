function %(p::Polynom, b)
    coeff=zeros(Rational{Int}, size(p))
    coeffs=p.coeff
    for i in eachindex(p.coeff)
        coeff[i]=coeffs[i]%b
    end
    return Polynom(coeff)
end

function ÷(p::Polynom, b)
    coeff=zeros(Rational{Int}, size(p))
    coeffs=p.coeff
    for i in eachindex(p.coeff)
        coeff[i]=coeffs[i]÷b
    end
    return Polynom(coeff)
end