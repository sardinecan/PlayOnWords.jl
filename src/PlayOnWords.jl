module PlayOnWords

using Unicode

function is_anagram(first::String, second::String)
    # remove spaces and diacritics
    first = first |> x -> replace(x, " " => "") |> x -> Unicode.normalize(x, stripmark=true) |> x -> lowercase(x)
    second = second |> x -> replace(x, " " => "") |> x -> Unicode.normalize(x, stripmark=true) |> x -> lowercase(x)
    
    if length(first) != length(second)
        return false
    end
    
    return sort(collect(first)) == sort(collect(second)) #turn the strings to arrays, sort and compare
end
export is_anagram

function is_palindrome(term::Union{String, Int64})
    normalizes_term = string(term) |> x -> replace(x, " " => "") |> x -> Unicode.normalize(x, stripmark=true) |> x -> lowercase(x)
    return normalizes_term == reverse(normalizes_term)
end
export is_palindrome

function is_pangram(sentence::String)
    alphabet = Set('a':'z')
    normalized_sentence = lowercase(sentence) |> x -> replace(x, r"[^a-z]" => "")
    chars = Set(normalized_sentence)
    return all(c -> c in chars, alphabet)
end
export is_pangram    

end # end module PlayOnWords
