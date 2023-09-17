describe("Product Details", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should navigate to a product detail page when a product is clicked", () => {
    // Click on the first product in the list
    cy.get(".products-index").first().click({ force: true });

    // Assert that the URL has changed to a product detail page
    cy.url().should("include", "/1");

    // Assert that product details are displayed on the page
    cy.get(".products-index").should("be.visible");
  });
});
