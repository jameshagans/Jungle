describe("Product Details", () => {
  beforeEach(() => {
    cy.visit("/");
  });
  it("should load product details page after clicking on the product from home page", () => {
    cy.get(".products")
      .should("be.visible")
      .find("article:first")
      .contains("Scented Blade")
      .click();
    cy.url().should("include", "/products/2");
  });
});
