describe("Add to Cart", () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should increase the cart count when a product is added", () => {

    // Click the 'Add to Cart' button for a product
    cy.get(".add-to-cart").first().click({ force: true });

    // Verify that the cart count has increased by one
    cy.get(".nav-link").eq(4).contains('1');

  });
});