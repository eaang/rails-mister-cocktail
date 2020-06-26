pics = [
  'https://www.thecocktaildb.com/images/media/drink/deu59m1504736135.jpg',
  'https://www.thecocktaildb.com/images/media/drink/iq6scx1487603980.jpg',
  'https://www.thecocktaildb.com/images/media/drink/urpvvv1441249549.jpg',
  'https://www.thecocktaildb.com/images/media/drink/rwpswp1454511017.jpg',
  'https://www.thecocktaildb.com/images/media/drink/uppqty1472720165.jpg',
  'https://www.thecocktaildb.com/images/media/drink/51ezka1551456113.jpg',
  'https://www.thecocktaildb.com/images/media/drink/1bw6sd1487603816.jpg',
  'https://www.thecocktaildb.com/images/media/drink/ttsvwy1472668781.jpg',
  'https://www.thecocktaildb.com/images/media/drink/ojsezf1582477277.jpg',
  'https://www.thecocktaildb.com/images/media/drink/h1e0e51510136907.jpg'
]
pics each_with_index do |pic, index|
  curl pic > "#{index}.jpg"
end