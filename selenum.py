from selenium import webdriver
from selenium.common.exceptions import NoSuchElementException
from selenium.webdriver.common.by import By

# Create a webdriver instance
driver = webdriver.Chrome()  # Assuming you are using Chrome as the browser

# Navigate to the blog-page
# Replace with the URL of your blog-page
driver.get("https://anikangi.github.io/blog")

# Find all the links on the page
links = driver.find_elements(By.TAG_NAME, "a")

# Loop through each link and click on it
for link in links:
    link_title = link.text  # Get the text of the link
    link.click()  # Click on the link

    try:
        # Get the title of the blog post on the linked page
        blog_post_title = driver.find_element(By.TAG_NAME, "h1").text
        print(
            f"Link Title: {link_title} -> Blog Post Title: {blog_post_title}")
    except NoSuchElementException:
        # If the blog post title is not found, print an error message
        print(
            f"Link Title: {link_title} -> Blog Post Title: Not found or 404 page")

    driver.back()  # Go back to the blog-page

# Close the webdriver
driver.quit()
