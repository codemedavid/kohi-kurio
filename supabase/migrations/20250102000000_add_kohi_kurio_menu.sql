/*
  # Add KOHI + KURIO Menu Items
  
  This migration adds the complete menu for KOHI + KURIO coffee shop including:
  1. Menu categories
  2. Menu items with descriptions and pricing
  3. Size variations for coffee and other drinks
  4. Add-on options for appetizers (dip options)
*/

-- First, let's add the new categories
INSERT INTO categories (id, name, icon, sort_order, active) VALUES
  ('soda-pop', 'Soda Pop', '🥤', 1, true),
  ('appetizers', 'Appetizers', '🍟', 2, true),
  ('coffee', 'Coffee', '☕', 3, true),
  ('sweets-desserts', 'Sweets / Desserts', '🍰', 4, true),
  ('non-coffee', 'Non-Coffee', '🥛', 5, true),
  ('matcha', 'Matcha', '🍵', 6, true),
  ('coffee-alternative', 'Coffee (Alternative/Extended)', '🌾', 7, true),
  ('main-plates', 'Main Plates', '🍽️', 8, true)
ON CONFLICT (id) DO UPDATE SET
  name = EXCLUDED.name,
  icon = EXCLUDED.icon,
  sort_order = EXCLUDED.sort_order,
  active = EXCLUDED.active;

-- Add menu items
INSERT INTO menu_items (name, description, base_price, category, popular, available, image_url, discount_active) VALUES
  -- Soda Pop
  ('Passion Poppu (Passion Fruit Soda)', 'A sparkling burst of passionfruit – bright, tangy, and refreshingly bold. Like summer in a glass with a bold sparkle twist.', 149.00, 'soda-pop', false, true, null, false),
  ('Momo Poppu (Peach Fruit Soda)', 'Light and bubbly with a mellow peach flavor – a pretty-in-pink sparkle that tastes like pure sunshine.', 149.00, 'soda-pop', false, true, null, false),
  ('Aoringo Furasshu (Green Apple Fruit Soda)', 'Bright green apple flavor with a sharp, sparkling twist – a zesty burst of freshness in every sip.', 149.00, 'soda-pop', false, true, null, false),
  ('Ichigo Poppu (Strawberry Fruit Soda)', 'A bubbly burst of strawberry flavor with just the right sparkle – sweet, light, and full of cafe charm.', 149.00, 'soda-pop', false, true, null, false),
  
  -- Appetizers
  ('Ringu Ringu (Onion Rings)', 'Lightly battered onion rings fried to a perfect crunch. Snackable and irresistibly good with every bite.', 159.00, 'appetizers', false, true, null, false),
  ('Pote Pote (Potato Wedges)', 'Thick-cut potato wedges coated in savory seasoning, fried to golden perfection.', 149.00, 'appetizers', false, true, null, false),
  ('Yaki Yoro (Grilled Sausages)', 'Grilled sausages served with crispy fries – street food soul with a flair.', 179.00, 'appetizers', false, true, null, false),
  ('Maru Cheezu (Mozzarella Sticks)', 'Crispy on the outside with a soft, stretchy mozzarella center. Perfectly poppable!', 169.00, 'appetizers', false, true, null, false),
  ('Gyomanduu (Gyoza Mandu)', 'A delightful cross between Japanese gyoza and Korean mandu – pan-fried to golden perfection with flavorful, steaming hot filling inside.', 169.00, 'appetizers', false, true, null, false),
  
  -- Coffee
  ('Shibui Drip (Caffe Americano)', 'A dark stream of quiet strength, softened by a trace of quiet. Like a slow conversation on a rainy Tokyo afternoon – unhurried, refined, unforgettable.', 139.00, 'coffee', true, true, null, false),
  ('Köhi Ratte (Caffe Latte)', 'Espresso and Köhi Kloud in gentle harmony, poured over ice. A familiar embrace in a glass – simple, steady, and always welcome.', 149.00, 'coffee', true, true, null, false),
  ('Mochaako (Caffe Mocha)', 'Espresso swirled with Köhi Kloud and rich chocolate – poured over ice that makes you smile before the first sip.', 179.00, 'coffee', false, true, null, false),
  ('Amato Köhi (Spanish Latte)', 'Espresso, Köhi Kloud and condensed milk, sweetened just right and kissed with cinnamon. Like a warm memory served cold – sweet signature coffee blend.', 179.00, 'coffee', false, true, null, false),
  
  -- Sweets / Desserts
  ('Kissamisu (Tiramisu)', 'Not your classic tiramisu made with luscious espresso-soaked sponge, and a dusting of cocoa. Inspired by the charm of old-school kissaten – soft, rich, and undeniably comforting.', 109.00, 'sweets-desserts', false, true, null, false),
  ('Bananoffi (Banoffee)', 'Banana, toffee, and whipped cream on a buttery graham base. A luscious mess of flavors and textures – delightfully oishii in every bite.', 109.00, 'sweets-desserts', false, true, null, false),
  ('Espresso Affogato', 'A cup of Carmen''s Best Madagascar vanilla ice cream "drowned" in a rich shot of fresh pulled espresso. Hot meets cold, bitter meets sweet.', 249.00, 'sweets-desserts', false, true, null, false),
  ('Matcha Affogato', 'Carmen''s Best "drowned" vanilla ice cream gently in warm, frothy matcha. A Japanese twist on the Italian classic – where green tea''s calm meets sweet indulgence.', 249.00, 'sweets-desserts', false, true, null, false),
  
  -- Non-Coffee
  ('Banira Miruku (Vanilla Milk)', 'Steamed Köhi Kloud infused with the delicate sweetness of vanilla. Simple, soothing, and endlessly comforting.', 199.00, 'non-coffee', false, true, null, false),
  ('Choko Miruku (Choco Milk)', 'Smooth milk blended with decadent chocolate. A timeless treat that feels like childhood in every sip.', 189.00, 'non-coffee', false, true, null, false),
  ('Ichigo Miruku (Strawberry Milk)', 'Silky milk blended with strawberry for a pastel pink treat – milk blended with strawberry for a pastel pink treat – comforting as a cafe daydream.', 199.00, 'non-coffee', false, true, null, false),
  ('Yume Ube (Taro-Ube Milk)', 'A velvety ube latte made with the rich purple yam''s natural sweetness, blended with silky milk for a smooth, nutty flavor.', 199.00, 'non-coffee', false, true, null, false),
  
  -- Matcha
  ('Matcha Rate (Matcha Latte)', 'Ceremonial-grade matcha whisked into silky Köhi Kloud for a smooth, earthy sweetness. A sip of pure zen, whether for quiet mornings or unhurried afternoons.', 169.00, 'matcha', false, true, null, false),
  ('Matcha Shot (Matcha Espresso)', 'Smooth Japanese matcha shot of espresso poured over ice and Köhi Kloud. Where calm tradition and modern energy swirl together in one invigorating sip.', 169.00, 'matcha', false, true, null, false),
  ('Midori Bara (Matcha Pistachio-Rose)', 'Ceremonial matcha, Köhi Kloud and creamy pistachio, crowned with soft rose petals. A graceful sip that feels like a quiet garden in full bloom. Our signature matcha drink!', 229.00, 'matcha', true, true, null, false),
  ('Matcha Ichigo (Matcha-Strawberry)', 'Velvety matcha latte blended with the gentle sweetness of strawberries. A dreamy fusion of green tea calm and berry-kissed delight.', 189.00, 'matcha', false, true, null, false),
  
  -- Coffee (Alternative/Extended)
  ('Mitsu Mugi Latte (Honey Oat Latte)', 'Espresso blended with smooth oat milk and golden honey. A slow pour into a cup – like a warm morning in the countryside.', 179.00, 'coffee-alternative', false, true, null, false),
  ('Shiro Kyara Meru (White Caramel Latte)', 'Espresso and velvety Köhi Kloud folded with silky white chocolate and caramel. Gentle and golden-like sipping a sunlit cloud.', 199.00, 'coffee-alternative', false, true, null, false),
  ('Kurogoma Ratte (Black Sesame Latte)', 'Roasted black sesame blended with espresso and silky steamed milk for a rich, toasty depth. Comforting and silky.', 189.00, 'coffee-alternative', false, true, null, false),
  ('Bisu Köhi (Biscoff Latte)', 'Espresso and Köhi Kloud swirled with the caramelized warmth of Biscoff. Comforting and fragrant – like dipping your favorite biscuit into a lazy afternoon.', 199.00, 'coffee-alternative', false, true, null, false),
  
  -- Main Plates - Pasta
  ('Kuro no Kinoko (Black Truffle Mushroom Pasta)', 'Pappardelle noodles coated in a luxurious black truffle mushroom infused cream sauce with garlic and herbs. A luxurious harmony of earth and cream in every forkful.', 199.00, 'main-plates', false, true, null, false),
  ('Torichiki Pesto (Chicken Pesto)', 'Al dente pasta tossed in a rich, basil pesto cream sauce with tender bits of chicken. A hearty balance of fresh herbs and creamy indulgence in every bite.', 199.00, 'main-plates', false, true, null, false),
  
  -- Main Plates - Rice Dishes
  ('Bifu Karudereta (Beef Caldereta)', 'Tomato-cooked beef simmered with potatoes, carrots, and peppers. A Filipino classic with tender meat and bold, homey flavors – made to warm both heart and hunger.', 199.00, 'main-plates', false, true, null, false),
  ('Bifu Paresu (Beef Pares)', 'Tender beef braised in a soy-based sauce with warm spices, served with garlic rice. A hearty Filipino street classic reimagined – rich in flavor, rich in comfort.', 199.00, 'main-plates', false, true, null, false);

-- Add size variations for coffee and drinks that have hot/iced options
INSERT INTO variations (menu_item_id, name, price) VALUES
  -- Coffee variations
  ((SELECT id FROM menu_items WHERE name = 'Shibui Drip (Caffe Americano)'), 'Hot', 0.00),
  ((SELECT id FROM menu_items WHERE name = 'Shibui Drip (Caffe Americano)'), 'Iced', 10.00),
  ((SELECT id FROM menu_items WHERE name = 'Köhi Ratte (Caffe Latte)'), 'Hot', 0.00),
  ((SELECT id FROM menu_items WHERE name = 'Köhi Ratte (Caffe Latte)'), 'Iced', 20.00),
  ((SELECT id FROM menu_items WHERE name = 'Mochaako (Caffe Mocha)'), 'Hot', 0.00),
  ((SELECT id FROM menu_items WHERE name = 'Mochaako (Caffe Mocha)'), 'Iced', 20.00),
  ((SELECT id FROM menu_items WHERE name = 'Amato Köhi (Spanish Latte)'), 'Hot', 0.00),
  ((SELECT id FROM menu_items WHERE name = 'Amato Köhi (Spanish Latte)'), 'Iced', 20.00),
  
  -- Non-Coffee variations
  ((SELECT id FROM menu_items WHERE name = 'Choko Miruku (Choco Milk)'), 'Hot', 0.00),
  ((SELECT id FROM menu_items WHERE name = 'Choko Miruku (Choco Milk)'), 'Iced', 10.00),
  
  -- Matcha variations
  ((SELECT id FROM menu_items WHERE name = 'Matcha Rate (Matcha Latte)'), 'Hot', 0.00),
  ((SELECT id FROM menu_items WHERE name = 'Matcha Rate (Matcha Latte)'), 'Iced', 20.00),
  ((SELECT id FROM menu_items WHERE name = 'Matcha Shot (Matcha Espresso)'), 'Hot', 0.00),
  ((SELECT id FROM menu_items WHERE name = 'Matcha Shot (Matcha Espresso)'), 'Iced', 20.00),
  
  -- Coffee Alternative variations
  ((SELECT id FROM menu_items WHERE name = 'Mitsu Mugi Latte (Honey Oat Latte)'), 'Hot', 0.00),
  ((SELECT id FROM menu_items WHERE name = 'Mitsu Mugi Latte (Honey Oat Latte)'), 'Iced', 20.00),
  ((SELECT id FROM menu_items WHERE name = 'Bisu Köhi (Biscoff Latte)'), 'Hot', 0.00),
  ((SELECT id FROM menu_items WHERE name = 'Bisu Köhi (Biscoff Latte)'), 'Iced', 30.00);

-- Add dip options as add-ons for appetizers
INSERT INTO add_ons (menu_item_id, name, price, category) VALUES
  -- Dip options for Ringu Ringu (Onion Rings)
  ((SELECT id FROM menu_items WHERE name = 'Ringu Ringu (Onion Rings)'), 'Catsuup-Mayo', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Ringu Ringu (Onion Rings)'), 'Catsuup-Mustard', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Ringu Ringu (Onion Rings)'), 'Spicy Aioli', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Ringu Ringu (Onion Rings)'), 'Koi Maji', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Ringu Ringu (Onion Rings)'), 'Wasabi Mayo', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Ringu Ringu (Onion Rings)'), 'Garlic Mayo', 0.00, 'dip'),
  
  -- Dip options for Pote Pote (Potato Wedges)
  ((SELECT id FROM menu_items WHERE name = 'Pote Pote (Potato Wedges)'), 'Catsuup-Mayo', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Pote Pote (Potato Wedges)'), 'Catsuup-Mustard', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Pote Pote (Potato Wedges)'), 'Spicy Aioli', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Pote Pote (Potato Wedges)'), 'Koi Maji', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Pote Pote (Potato Wedges)'), 'Wasabi Mayo', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Pote Pote (Potato Wedges)'), 'Garlic Mayo', 0.00, 'dip'),
  
  -- Dip options for Yaki Yoro (Grilled Sausages)
  ((SELECT id FROM menu_items WHERE name = 'Yaki Yoro (Grilled Sausages)'), 'Catsuup-Mayo', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Yaki Yoro (Grilled Sausages)'), 'Catsuup-Mustard', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Yaki Yoro (Grilled Sausages)'), 'Spicy Aioli', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Yaki Yoro (Grilled Sausages)'), 'Koi Maji', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Yaki Yoro (Grilled Sausages)'), 'Wasabi Mayo', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Yaki Yoro (Grilled Sausages)'), 'Garlic Mayo', 0.00, 'dip'),
  
  -- Dip options for Maru Cheezu (Mozzarella Sticks)
  ((SELECT id FROM menu_items WHERE name = 'Maru Cheezu (Mozzarella Sticks)'), 'Catsuup-Mayo', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Maru Cheezu (Mozzarella Sticks)'), 'Catsuup-Mustard', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Maru Cheezu (Mozzarella Sticks)'), 'Spicy Aioli', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Maru Cheezu (Mozzarella Sticks)'), 'Koi Maji', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Maru Cheezu (Mozzarella Sticks)'), 'Wasabi Mayo', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Maru Cheezu (Mozzarella Sticks)'), 'Garlic Mayo', 0.00, 'dip'),
  
  -- Dip options for Gyomanduu (Gyoza Mandu)
  ((SELECT id FROM menu_items WHERE name = 'Gyomanduu (Gyoza Mandu)'), 'Catsuup-Mayo', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Gyomanduu (Gyoza Mandu)'), 'Catsuup-Mustard', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Gyomanduu (Gyoza Mandu)'), 'Spicy Aioli', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Gyomanduu (Gyoza Mandu)'), 'Koi Maji', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Gyomanduu (Gyoza Mandu)'), 'Wasabi Mayo', 0.00, 'dip'),
  ((SELECT id FROM menu_items WHERE name = 'Gyomanduu (Gyoza Mandu)'), 'Garlic Mayo', 0.00, 'dip');

-- Update existing categories to be inactive if they're not in the new menu
UPDATE categories SET active = false WHERE id NOT IN (
  'soda-pop', 'appetizers', 'coffee', 'sweets-desserts', 'non-coffee', 
  'matcha', 'coffee-alternative', 'main-plates'
);
