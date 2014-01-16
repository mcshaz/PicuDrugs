﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PICUdrugs.DAL;

namespace PICUdrugs
{
    using System;
    using System.Collections.Generic;

    // Define the Business Object "Product" with two public properties
    //    of simple datatypes.
    public class Product
    {
        private string m_name;
        private int m_price;

        public Product(string name, int price)
        {
            m_name = name;
            m_price = price;
        }

        public string Name
        {
            get
            {
                return m_name;
            }
        }

        public int Price
        {
            get
            {
                return m_price;
            }
        }
    }

    // Define Business Object "Merchant" that provides a 
    //    GetProducts method that returns a collection of 
    //    Product objects.

    public class Merchant
    {
        private List<Product> m_products;

        public Merchant()
        {
            m_products = new List<Product>();
            m_products.Add(new Product("Pen", 25));
            m_products.Add(new Product("Pencil", 30));
            m_products.Add(new Product("Notebook", 15));
        }

        public List<Product> GetProducts()
        {
            return m_products;
        }
    }
    public class mylist
    {
        public mylist()
        {
            _myinfusion = new List<standardInfusion>();
            standardInfusion item1 = new standardInfusion(12, 1, 50, -6, -3, "grams", true, true, true, false, false, 1, 10);
            _myinfusion.Add(item1);
        }
        private List<standardInfusion> _myinfusion;
        public List<standardInfusion> getMyList()
        {
            return _myinfusion;
        }
    }
}