describe('The Jungle Application, Add to Cart', () => {
  beforeEach(() => {
    cy.visit("/");
  });

  it("should display products on the home page", () => {
    cy.get(".products").should('exist');
    cy.get(".products article").should("be.visible");
  });

  it("should display 2 products on the home page", () => {
    cy.get(".products article").should("have.length", 2);
  });

  
  it("should increase cart count when 'Add to Cart' button is clicked", () => {
    
    cy.get(".cart-count").then(($cartCount) => {
      const initialCartCount = parseInt($cartCount.text());

      cy.get(".products article:first-child").within(() => {
        cy.contains("Add to Cart").click();
      });
 
      cy.get(".cart-count").should(($cartCount) => {
        const currentCartCount = parseInt($cartCount.text());
        expect(currentCartCount).to.eq(initialCartCount + 1);
      });
    });
  });
});