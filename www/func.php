<?php
    function isValid($word)
    {
        return preg_match('/[^\'"<>()\[\]{}]*/',$word);
    }
    function toNum($word)
    {
        return preg_replace('/[^0-9]/','',$word);
    }
    function isName($word)
    {
        return preg_match('/[a-zA-Zéèêëàâä]*/',$word);
    }
    function isCodePostal($word)
    {
        return preg_match('/[0-9][0-9][0-9][0-9][0-9]/',$word);
    }
    function GET_key($key)
    {
        return preg_replace('/[^0-9a-f]/','',$_GET[$key]);
    }
    function GET_valid($key)
    {
        return str_replace('\'','&apos;',str_replace('"','&quot;',preg_replace('/[<>()\[\]{}]/','',$_GET[$key])));
    }
    function GET_num($key)
    {
        return preg_replace('/[^0-9]/','',$_GET[$key]);
    }
    function GET_letters($key)
    {
        return preg_replace('/[^a-z]/','',$_GET[$key]);
    }
    function GET_exist($key)
    {
        return isset($_GET[$key]);
    }
    function GET_text($key)
    {
        return htmlspecialchars($_GET[$key]);
    }

    function COOKIE_num($key)
    {
        return preg_replace('/[^0-9]/','',$_COOKIE[$key]);
    }
    function COOKIE_key($key)
    {
        return preg_replace('/[^0-9a-f]/','',$_COOKIE[$key]);
    }
    function COOKIE_letters($key)
    {
        return preg_replace('/[^a-z]/','',$_COOKIE[$key]);
    }
    function COOKIE_exist($key)
    {
        return isset($_COOKIE[$key]);
    }
    function getpanier()
    {
        return preg_replace('/[^0-9;:]/','',$_COOKIE['panier']);
    }
    function panier_exist()
    {
        return isset($_COOKIE['panier']);
    }
    function addzeros($word,$num)
    {
        while($num-strlen($word))$word='0'.$word;
        return $word;
    }
    function pload_svg($svg,$para)
    {
        $func_para1=$para;
        include $svg;
    }
    function load_svg($svg)
    {
        $func_para1="";
        include $svg;
    }
?>